package org.keycloak.devday.scenarios;

import org.junit.jupiter.api.Test;
import org.keycloak.testframework.annotations.InjectRealm;
import org.keycloak.testframework.annotations.InjectUser;
import org.keycloak.testframework.annotations.KeycloakIntegrationTest;
import org.keycloak.testframework.realm.ManagedRealm;
import org.keycloak.testframework.realm.ManagedUser;

@KeycloakIntegrationTest
public class DevDay1EmailEventListenerTest {

    @InjectRealm
    ManagedRealm realm;

    @InjectUser
    ManagedUser user;

    @Test
    public void testFailedLoginEmailEvent() {
        // TODO
    }
}
