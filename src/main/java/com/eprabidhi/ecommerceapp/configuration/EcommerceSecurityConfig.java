package com.eprabidhi.ecommerceapp.configuration;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class EcommerceSecurityConfig {

	

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	

	 @Bean
	 SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

         http.authorizeHttpRequests(authorize -> authorize
                                 .requestMatchers("/admin/**").hasRole("ADMIN")
                                 .requestMatchers("/user/**").hasRole("USER")
                 )
                 .authorizeHttpRequests(authorize -> authorize
                                 .requestMatchers("/**").permitAll()
                                 .anyRequest().authenticated()
                 )
                 .formLogin(login -> login
                         .defaultSuccessUrl("/welcome", true)
                         .failureUrl("/login?failed")
                         .permitAll())
                 .logout(logout -> logout.logoutUrl("/logout").permitAll()
                         .invalidateHttpSession(true));
                // .csrf(csrf -> csrf.disable());
             return http.build();
	    }
	
	
		@Autowired
		public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
			auth.jdbcAuthentication()
	    	.dataSource(dataSource)
	    	.passwordEncoder(passwordEncoder)
	    		.usersByUsernameQuery("select username, password, active from user_detail_tbl where username=?")
	    
	    		.authoritiesByUsernameQuery("select ud.username, ur.role from user_detail_tbl "
	    				+ "as ud, user_role_tbl as ur where ud.user_id = ur.user_id and ud.username=?");
			
			auth.inMemoryAuthentication()
				.passwordEncoder(passwordEncoder)
				.withUser("admin")
				.password("$2a$10$zAuHy6afN/lyuBIexVte.eodhrb2/mgGG2lHY3eiWOQndPdFNw/Q2")
				.disabled(false)
				.roles("ADMIN");
	}
		
	
}