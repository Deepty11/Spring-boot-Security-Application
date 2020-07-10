package com.rehnuma.springbootsecurity.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.util.matcher.AndRequestMatcher;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder(){
        return new BCryptPasswordEncoder();
    };

    @Bean
    public UserDetailsService userDetailsService(){
        return new UserDetailsImpl();
    }

    @Bean
    public DaoAuthenticationProvider daoAuthenticationProvider(){
        DaoAuthenticationProvider daoAuthenticationProvider=new DaoAuthenticationProvider();
        daoAuthenticationProvider.setUserDetailsService(userDetailsService());
        daoAuthenticationProvider.setPasswordEncoder(bCryptPasswordEncoder());
        return daoAuthenticationProvider;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
       auth.authenticationProvider(daoAuthenticationProvider());

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        System.out.println("I am in Security configuration -> configure -> AUTHORIZATION");
        String[] staticResources={

                "/resources/images/**",
                "/resources/user_images/**",
                "/resources/static/**",
                "/",
                "/signUp",
                "/home"

        };
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers(staticResources).permitAll()
                .anyRequest()
                .authenticated()
                .and()
                .formLogin().loginPage("/login").usernameParameter("email").passwordParameter("password")
                .loginProcessingUrl("/doLogin")
                .failureForwardUrl("/login?error=true")
                .defaultSuccessUrl("/home")
                .permitAll()
                .and()
                .logout()
                .logoutSuccessUrl("/logout")
                .logoutUrl("/doLogout")
                .permitAll();
    }


}
