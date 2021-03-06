package com.tai.vikopru.service;

import com.tai.vikopru.dao.RoleDao;
import com.tai.vikopru.dao.UserDao;
import com.tai.vikopru.entity.Role;
import com.tai.vikopru.entity.User;
import com.tai.vikopru.crm.CrmUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Transactional
    public User findByUserName(String username) {
        return userDao.findByUserName(username);
    }

    @Transactional
    public void save(CrmUser crmUser) {
        User user = new User(
                crmUser.getUsername(),
                passwordEncoder.encode(crmUser.getPassword()),
                crmUser.getEmail(),
                crmUser.getFirstName(),
                crmUser.getLastName(),
                crmUser.getGender());

        user.setRoles(Arrays.asList(roleDao.findRoleByName("ROLE_USER")));
        userDao.save(user);
    }

    @Transactional
    public List<User> getAll() {
        return userDao.getAll();
    }

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDao.findByUserName(username);
        if (user == null) {
            throw new UsernameNotFoundException("Nie znaleziono użytkownika.");
        }
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(),
                mapRolesToAuthorities(user.getRoles()));
    }

    private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles) {
        return roles.stream().map(role -> new SimpleGrantedAuthority(role.getName())).collect(Collectors.toList());
    }

    @Transactional
    public void delete(Integer id) {
        userDao.delete(id);
    }
}
