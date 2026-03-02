package org.keycloak.devday.extension;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.keycloak.common.util.KeycloakUriBuilder;
import org.keycloak.http.simple.SimpleHttp;
import org.keycloak.testframework.annotations.InjectRealm;
import org.keycloak.testframework.annotations.InjectSimpleHttp;
import org.keycloak.testframework.annotations.KeycloakIntegrationTest;
import org.keycloak.testframework.realm.ManagedRealm;
import org.keycloak.testframework.server.KeycloakServerConfig;
import org.keycloak.testframework.server.KeycloakServerConfigBuilder;

import java.io.IOException;
import java.net.URL;

@KeycloakIntegrationTest(config = DevDayProviderTest.ServerConfig.class)
public class DevDayProviderTest {

    @InjectRealm
    ManagedRealm realm;

    @InjectSimpleHttp
    SimpleHttp simpleHttp;

    @Test
    public void providerTest() throws IOException {
        URL url = KeycloakUriBuilder.fromUri(realm.getBaseUrl()).path("/devday/hello").build().toURL();

        String response = simpleHttp.doGet(url.toString()).header("Accept", "text/plain").asString();

        Assertions.assertEquals("Hello Keycloak DevDay 26!", response);
    }


    static class ServerConfig implements KeycloakServerConfig {

        @Override
        public KeycloakServerConfigBuilder configure(KeycloakServerConfigBuilder config) {
            return config.dependencyCurrentProject();
        }
    }
}
