package com.qintess.letsgo.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.qintess.letsgo.services.UsuarioLoginService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{


	@Autowired
	private UsuarioLoginService userDetailsService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(encoder());
	}

	@Bean
	public PasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public AuthenticationManager customAuthenticatorManager() throws Exception {
		return authenticationManager();
	}
	
    @Override
    public void configure(WebSecurity web) throws Exception {    	
        web.ignoring().antMatchers("/css/**");
        web.ignoring().antMatchers("/js/**");
        web.ignoring().antMatchers("/assets/**");
    }

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()
			.antMatchers("/")
			.permitAll()
			.antMatchers("/usuario/cadastrar/**")
			.permitAll()
			.antMatchers("/usuario/salva/**")
			.permitAll()
			.antMatchers("/evento/cadastrar", "/evento/alterar", "/evento/deletar")
			.hasRole("organizador")
			.antMatchers("/evento/comprar")
			.authenticated()
			.antMatchers("/CasaDeShow/cadastrar", "/CasaDeShow/alterar/**" , "/CasaDeShow/deletar/**")
			.permitAll()
			.antMatchers("/evento/**", "/CasaDeShow/**", "/error")
			.permitAll()
			.anyRequest()
			.authenticated()
			.and()
	     .exceptionHandling()
	     	.accessDeniedPage("/error")
	        .and()
		.formLogin()
			.loginPage("/usuario/login")
			.loginProcessingUrl("/loga")
			.failureUrl("/usuario/login-error")
			.permitAll()
			.and()
		.logout()
			.logoutUrl("/logout")
			.invalidateHttpSession(true)
			.logoutSuccessUrl("/")
			.permitAll()
		.and()
		.csrf().disable();
	}

}
