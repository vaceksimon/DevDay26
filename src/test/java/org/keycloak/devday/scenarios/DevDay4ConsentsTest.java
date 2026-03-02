package org.keycloak.devday.scenarios;

import org.junit.jupiter.api.Test;
import org.keycloak.testframework.annotations.InjectRealm;
import org.keycloak.testframework.annotations.InjectUser;
import org.keycloak.testframework.annotations.KeycloakIntegrationTest;
import org.keycloak.testframework.realm.ManagedRealm;
import org.keycloak.testframework.realm.ManagedUser;
import org.keycloak.testframework.realm.UserConfig;
import org.keycloak.testframework.realm.UserConfigBuilder;

@KeycloakIntegrationTest
public class DevDay4ConsentsTest {

    @InjectRealm
    ManagedRealm realm;

    @InjectUser(config = ProviderRealmUserConf.class)
    ManagedUser user;

    @Test
    public void testConsentCancel() {
        // TODO
    }

    private static class ProviderRealmUserConf implements UserConfig {

        @Override
        public UserConfigBuilder configure(UserConfigBuilder builder) {
            return builder.name("Provider", "User")
                    .username("provider")
                    .password("password")
                    .email("provider@local")
                    .emailVerified(true);
        }
    }
}
