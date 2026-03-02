package org.keycloak.devday.extension;

import org.junit.jupiter.api.Test;
import org.keycloak.testframework.annotations.InjectRealm;
import org.keycloak.testframework.annotations.KeycloakIntegrationTest;
import org.keycloak.testframework.realm.ManagedRealm;

@KeycloakIntegrationTest
public class DevDayProviderTest {

    @InjectRealm
    ManagedRealm realm;

    @Test
    public void providerTest() {
        // TODO
    }
}
