package org.keycloak.devday.scenarios;

import jakarta.ws.rs.ServerErrorException;
import jakarta.ws.rs.core.Response;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.keycloak.common.Profile;
import org.keycloak.testframework.annotations.InjectRealm;
import org.keycloak.testframework.annotations.InjectUser;
import org.keycloak.testframework.annotations.KeycloakIntegrationTest;
import org.keycloak.testframework.realm.ManagedRealm;
import org.keycloak.testframework.realm.ManagedUser;
import org.keycloak.testframework.server.KeycloakServerConfig;
import org.keycloak.testframework.server.KeycloakServerConfigBuilder;

@KeycloakIntegrationTest(config = DevDay3ImpersonationDisabledTest.ServerConfig.class)
public class DevDay3ImpersonationDisabledTest {

    @InjectRealm
    ManagedRealm realm;

    @InjectUser
    ManagedUser user;

    @Test
    public void testImpersonationDisabled() {
        try {
            user.admin().impersonate();
            Assertions.fail("Feature impersonation should be disabled.");
        } catch (ServerErrorException e) {
            Assertions.assertEquals(Response.Status.NOT_IMPLEMENTED.getStatusCode(), e.getResponse().getStatus());
        }
    }

    static class ServerConfig implements KeycloakServerConfig {

        @Override
        public KeycloakServerConfigBuilder configure(KeycloakServerConfigBuilder config) {
            return config.featuresDisabled(Profile.Feature.IMPERSONATION);
        }

    }

}
