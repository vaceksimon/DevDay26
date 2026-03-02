package org.keycloak.devday.scenarios;

import org.junit.jupiter.api.Test;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.crypto.Algorithm;
import org.keycloak.testframework.annotations.InjectAdminClient;
import org.keycloak.testframework.annotations.InjectRealm;
import org.keycloak.testframework.annotations.KeycloakIntegrationTest;
import org.keycloak.testframework.realm.ManagedRealm;

@KeycloakIntegrationTest
public class DevDay2AdminSignatureAlgorithmTest {

    @InjectAdminClient
    Keycloak admin;

    @InjectRealm(attachTo = "master")
    ManagedRealm masterRealm;

    @Test
    public void changeRealmTokenAlgorithm() {
        masterRealm.updateWithCleanup(r -> r.defaultSignatureAlgorithm(Algorithm.ES256));

        // TODO
    }
}
