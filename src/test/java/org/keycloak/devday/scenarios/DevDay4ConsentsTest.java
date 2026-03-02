package org.keycloak.devday.scenarios;

import org.junit.jupiter.api.Test;
import org.keycloak.admin.client.resource.ClientResource;
import org.keycloak.admin.client.resource.RealmResource;
import org.keycloak.representations.idm.ClientRepresentation;
import org.keycloak.testframework.annotations.InjectRealm;
import org.keycloak.testframework.annotations.InjectUser;
import org.keycloak.testframework.annotations.KeycloakIntegrationTest;
import org.keycloak.testframework.oauth.OAuthClient;
import org.keycloak.testframework.oauth.annotations.InjectOAuthClient;
import org.keycloak.testframework.realm.ManagedRealm;
import org.keycloak.testframework.realm.ManagedUser;
import org.keycloak.testframework.realm.UserConfig;
import org.keycloak.testframework.realm.UserConfigBuilder;
import org.keycloak.testframework.ui.annotations.InjectPage;
import org.keycloak.testframework.ui.annotations.InjectWebDriver;
import org.keycloak.testframework.ui.page.ConsentPage;
import org.keycloak.testframework.ui.page.LoginPage;
import org.keycloak.testframework.ui.webdriver.ManagedWebDriver;

@KeycloakIntegrationTest
public class DevDay4ConsentsTest {

    @InjectRealm
    ManagedRealm realm;

    @InjectUser(config = ProviderRealmUserConf.class)
    ManagedUser user;

    @InjectOAuthClient
    OAuthClient oAuthClient;

    @InjectWebDriver
    ManagedWebDriver driver;

    @InjectPage
    LoginPage loginPage;

    @InjectPage
    ConsentPage consentPage;

    @Test
    public void testConsentCancel() {
        // setup account client to require consent
        ClientResource accountClient = findClientByClientId(realm.admin(), "test-app");

        ClientRepresentation clientRepresentation = accountClient.toRepresentation();
        clientRepresentation.setConsentRequired(true);
        accountClient.update(clientRepresentation);

        // TODO
    }

    private ClientResource findClientByClientId(RealmResource realm, String clientId) {
        for (ClientRepresentation c : realm.clients().findAll()) {
            if (clientId.equals(c.getClientId())) {
                return realm.clients().get(c.getId());
            }
        }
        return null;
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
