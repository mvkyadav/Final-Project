package project.bfour.debtormaintenance.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
@EnableWebSecurity(debug = true)
public class WebSecurityConfigurerImpl{


    @Configuration
    @Order(2)
    public static class UserSecurityConfiguration extends WebSecurityConfigurerAdapter {

        public UserSecurityConfiguration(){
            super();
        }

        @Autowired
        UserDetailsService userDetailsService;

        @Override
        protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
            auth.userDetailsService(userDetailsService);
        }

        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http
//                    .antMatcher("/debtor/**") // Security filter chain: [] if included
                    .authorizeRequests()
                    .antMatchers(HttpMethod.GET, "/debtor/register", "/").permitAll()
                    .antMatchers(HttpMethod.POST, "/debtor/register").permitAll()
                    .anyRequest().hasRole("DEBTOR")
                    .and()

                    .formLogin()
                    .loginPage("/")
                    .loginProcessingUrl("/")
                    .defaultSuccessUrl("/debtor/home?loggedIn=true", true)
                    .failureUrl("/?error=true")
                    .and().logout()
                    .permitAll()
                    .logoutUrl("/debtor/logout")
                    .invalidateHttpSession(true)
                    .clearAuthentication(true)
                    .deleteCookies("JSESSIONID")
                    .logoutSuccessUrl("/?loggedOut=true");
        }
    }

    @Configuration
    @Order(1)
    public static class AdminSecurityConfiguration extends WebSecurityConfigurerAdapter {
        public AdminSecurityConfiguration(){
            super();
        }
//        inMemoryAuth

        @Override
        protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
            auth
                    .inMemoryAuthentication()
                    .withUser("admin")
                    .password(new BCryptPasswordEncoder().encode("ping@345"))
                    .roles("ADMIN");
        }

        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http
                    .antMatcher("/admin/**")
                    .authorizeRequests()
                    .antMatchers(HttpMethod.GET,"/admin/login*").permitAll()
                    .antMatchers(HttpMethod.POST,"/admin/login").permitAll()
                    .anyRequest().hasRole("ADMIN")
                    .and()

                    .formLogin()
                    .loginPage("/admin/login") //
                    .defaultSuccessUrl("/admin/home?loggedIn=true", true)
                    .failureUrl("/admin/login?error")
                    .permitAll()
                    .and().logout()
                    .logoutUrl("/admin/logout")
                    .invalidateHttpSession(true)
                    .clearAuthentication(true)
                    .deleteCookies("JSESSIONID")
                    .logoutSuccessUrl("/admin/login?loggedOut=true");
        }
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}

/**
 * testing : pending
 * security : done
 * exception handling : done
 * log4j : done
 */

