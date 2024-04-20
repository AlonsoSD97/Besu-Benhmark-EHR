@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  besu-untuned startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and BESU_UNTUNED_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-Dvertx.disableFileCPResolving=true" "-Dbesu.home=BESU_HOME" "-Dlog4j.shutdownHookEnabled=false" "-Dlog4j2.formatMsgNoLookups=true" "-Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager" "--add-opens" "java.base/sun.security.provider=ALL-UNNAMED" "--add-opens" "java.base/java.util=ALL-UNNAMED" "-Dio.netty.tryReflectionSetAccessible=true" "--add-exports" "java.base/jdk.internal.misc=ALL-UNNAMED" "--add-opens" "java.base/java.nio=ALL-UNNAMED"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\besu-24.3.3.jar;%APP_HOME%\lib\besu-evmtool-24.3.3.jar;%APP_HOME%\lib\besu-24.3.3.jar;%APP_HOME%\lib\besu-ethereum-ethstats-24.3.3.jar;%APP_HOME%\lib\besu-clique-24.3.3.jar;%APP_HOME%\lib\besu-ibft-24.3.3.jar;%APP_HOME%\lib\besu-qbft-24.3.3.jar;%APP_HOME%\lib\besu-consensus-common-24.3.3.jar;%APP_HOME%\lib\besu-retesteth-24.3.3.jar;%APP_HOME%\lib\besu-ethereum-stratum-24.3.3.jar;%APP_HOME%\lib\besu-api-24.3.3.jar;%APP_HOME%\lib\besu-merge-24.3.3.jar;%APP_HOME%\lib\besu-blockcreation-24.3.3.jar;%APP_HOME%\lib\besu-eth-24.3.3.jar;%APP_HOME%\lib\besu-permissioning-24.3.3.jar;%APP_HOME%\lib\besu-p2p-24.3.3.jar;%APP_HOME%\lib\besu-plugin-rocksdb-24.3.3.jar;%APP_HOME%\lib\referencetests-24.3.3.jar;%APP_HOME%\lib\besu-core-24.3.3.jar;%APP_HOME%\lib\core-support-test-24.3.3-test-support.jar;%APP_HOME%\lib\besu-config-24.3.3.jar;%APP_HOME%\lib\besu-pki-24.3.3.jar;%APP_HOME%\lib\enclave-24.3.3.jar;%APP_HOME%\lib\besu-crypto-services-24.3.3.jar;%APP_HOME%\lib\besu-trie-24.3.3.jar;%APP_HOME%\lib\besu-pipeline-24.3.3.jar;%APP_HOME%\lib\besu-tasks-24.3.3.jar;%APP_HOME%\lib\besu-metrics-rocksdb-24.3.3.jar;%APP_HOME%\lib\besu-metrics-core-24.3.3.jar;%APP_HOME%\lib\besu-kvstore-24.3.3.jar;%APP_HOME%\lib\plugin-api-24.3.3.jar;%APP_HOME%\lib\besu-evm-24.3.3.jar;%APP_HOME%\lib\besu-nat-24.3.3.jar;%APP_HOME%\lib\besu-util-24.3.3.jar;%APP_HOME%\lib\oshi-core-6.4.10.jar;%APP_HOME%\lib\graphql-java-21.3.jar;%APP_HOME%\lib\besu-datatypes-24.3.3.jar;%APP_HOME%\lib\besu-crypto-24.3.3.jar;%APP_HOME%\lib\core-4.10.3.jar;%APP_HOME%\lib\dnsjava-3.5.3.jar;%APP_HOME%\lib\tuweni-dns-discovery-2.4.2.jar;%APP_HOME%\lib\tuweni-devp2p-2.4.2.jar;%APP_HOME%\lib\client-java-18.0.1.jar;%APP_HOME%\lib\log4j-slf4j2-impl-2.22.1.jar;%APP_HOME%\lib\java-dataloader-3.2.1.jar;%APP_HOME%\lib\crypto-4.10.3.jar;%APP_HOME%\lib\Java-WebSocket-1.5.5.jar;%APP_HOME%\lib\jose4j-0.9.3.jar;%APP_HOME%\lib\slf4j-api-2.0.10.jar;%APP_HOME%\lib\besu-ethereum-rlp-24.3.3.jar;%APP_HOME%\lib\jackson-annotations-2.16.1.jar;%APP_HOME%\lib\vertx-web-4.3.5.jar;%APP_HOME%\lib\vertx-auth-jwt-4.3.5.jar;%APP_HOME%\lib\vertx-unit-4.3.5.jar;%APP_HOME%\lib\vertx-web-common-4.3.5.jar;%APP_HOME%\lib\vertx-auth-common-4.3.5.jar;%APP_HOME%\lib\vertx-bridge-common-4.3.5.jar;%APP_HOME%\lib\vertx-lang-kotlin-coroutines-4.3.7.jar;%APP_HOME%\lib\vertx-lang-kotlin-4.3.7.jar;%APP_HOME%\lib\vertx-core-4.3.5.jar;%APP_HOME%\lib\vertx-codegen-4.3.5.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.16.1.jar;%APP_HOME%\lib\jackson-core-2.16.1.jar;%APP_HOME%\lib\jackson-databind-2.16.1.jar;%APP_HOME%\lib\simpleclient_guava-0.16.0.jar;%APP_HOME%\lib\tuweni-net-2.4.2.jar;%APP_HOME%\lib\tuweni-merkle-trie-2.4.2.jar;%APP_HOME%\lib\tuweni-crypto-2.4.2.jar;%APP_HOME%\lib\tuweni-kv-2.4.2.jar;%APP_HOME%\lib\tuweni-io-2.4.2.jar;%APP_HOME%\lib\discovery-22.12.0.jar;%APP_HOME%\lib\grpc-netty-1.60.1.jar;%APP_HOME%\lib\grpc-core-1.60.1.jar;%APP_HOME%\lib\tuweni-kademlia-2.4.2.jar;%APP_HOME%\lib\grpc-context-1.60.1.jar;%APP_HOME%\lib\grpc-api-1.60.1.jar;%APP_HOME%\lib\grpc-util-1.60.1.jar;%APP_HOME%\lib\guava-33.0.0-jre.jar;%APP_HOME%\lib\dagger-2.50.jar;%APP_HOME%\lib\picocli-4.7.5.jar;%APP_HOME%\lib\maven-artifact-3.9.6.jar;%APP_HOME%\lib\client-java-api-18.0.1.jar;%APP_HOME%\lib\commons-lang3-3.14.0.jar;%APP_HOME%\lib\log4j-core-2.22.1.jar;%APP_HOME%\lib\tuweni-units-2.4.2.jar;%APP_HOME%\lib\tuweni-rlp-2.4.2.jar;%APP_HOME%\lib\tuweni-bytes-2.4.2.jar;%APP_HOME%\lib\tuweni-config-2.4.2.jar;%APP_HOME%\lib\tuweni-toml-2.4.2.jar;%APP_HOME%\lib\spring-security-crypto-6.2.1.jar;%APP_HOME%\lib\snappy-java-1.1.10.5.jar;%APP_HOME%\lib\jc-kzg-4844-0.8.0.jar;%APP_HOME%\lib\rocksdbjni-8.3.2.jar;%APP_HOME%\lib\log4j-jul-2.22.1.jar;%APP_HOME%\lib\splunk-library-javalogging-1.11.8.jar;%APP_HOME%\lib\jansi-2.4.1.jar;%APP_HOME%\lib\bcpkix-jdk18on-1.77.jar;%APP_HOME%\lib\abi-4.10.3.jar;%APP_HOME%\lib\log4j-api-2.22.1.jar;%APP_HOME%\lib\opentelemetry-extension-trace-propagators-1.33.0.jar;%APP_HOME%\lib\opentelemetry-sdk-extension-autoconfigure-1.33.0.jar;%APP_HOME%\lib\opentelemetry-exporter-otlp-1.33.0.jar;%APP_HOME%\lib\opentelemetry-sdk-extension-autoconfigure-spi-1.33.0.jar;%APP_HOME%\lib\opentelemetry-sdk-1.33.0.jar;%APP_HOME%\lib\opentelemetry-sdk-trace-1.33.0.jar;%APP_HOME%\lib\opentelemetry-sdk-metrics-1.33.0.jar;%APP_HOME%\lib\opentelemetry-sdk-logs-1.33.0.jar;%APP_HOME%\lib\opentelemetry-exporter-sender-okhttp-1.33.0.jar;%APP_HOME%\lib\opentelemetry-sdk-common-1.33.0.jar;%APP_HOME%\lib\opentelemetry-exporter-otlp-common-1.33.0.jar;%APP_HOME%\lib\opentelemetry-extension-incubator-1.33.0-alpha.jar;%APP_HOME%\lib\opentelemetry-api-events-1.33.0-alpha.jar;%APP_HOME%\lib\opentelemetry-exporter-common-1.33.0.jar;%APP_HOME%\lib\opentelemetry-api-1.33.0.jar;%APP_HOME%\lib\antlr4-4.11.1.jar;%APP_HOME%\lib\antlr4-runtime-4.11.1.jar;%APP_HOME%\lib\bcutil-jdk18on-1.77.jar;%APP_HOME%\lib\rlp-4.10.3.jar;%APP_HOME%\lib\utils-4.10.3.jar;%APP_HOME%\lib\bcprov-jdk18on-1.77.jar;%APP_HOME%\lib\caffeine-3.1.8.jar;%APP_HOME%\lib\value-annotations-2.10.0.jar;%APP_HOME%\lib\netty-all-4.1.104.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.104.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.104.Final-linux-x86_64.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.104.Final-linux-aarch_64.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.104.Final-linux-riscv64.jar;%APP_HOME%\lib\netty-transport-native-kqueue-4.1.104.Final.jar;%APP_HOME%\lib\netty-transport-native-kqueue-4.1.104.Final-osx-x86_64.jar;%APP_HOME%\lib\netty-transport-native-kqueue-4.1.104.Final-osx-aarch_64.jar;%APP_HOME%\lib\bls12-381-0.8.2.jar;%APP_HOME%\lib\arithmetic-0.8.2.jar;%APP_HOME%\lib\jna-platform-5.14.0.jar;%APP_HOME%\lib\secp256k1-0.8.2.jar;%APP_HOME%\lib\secp256r1-0.8.2.jar;%APP_HOME%\lib\blake2bf-0.8.2.jar;%APP_HOME%\lib\jna-5.14.0.jar;%APP_HOME%\lib\tuweni-concurrent-coroutines-2.4.2.jar;%APP_HOME%\lib\tuweni-concurrent-2.4.2.jar;%APP_HOME%\lib\netty-transport-classes-epoll-4.1.104.Final.jar;%APP_HOME%\lib\netty-transport-classes-kqueue-4.1.104.Final.jar;%APP_HOME%\lib\netty-codec-http2-4.1.104.Final.jar;%APP_HOME%\lib\netty-handler-proxy-4.1.104.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.104.Final.jar;%APP_HOME%\lib\netty-resolver-dns-native-macos-4.1.104.Final-osx-x86_64.jar;%APP_HOME%\lib\netty-resolver-dns-native-macos-4.1.104.Final-osx-aarch_64.jar;%APP_HOME%\lib\netty-resolver-dns-classes-macos-4.1.104.Final.jar;%APP_HOME%\lib\netty-resolver-dns-4.1.104.Final.jar;%APP_HOME%\lib\netty-handler-4.1.104.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.104.Final.jar;%APP_HOME%\lib\simpleclient_pushgateway-0.16.0.jar;%APP_HOME%\lib\simpleclient_httpserver-0.15.0.jar;%APP_HOME%\lib\simpleclient_common-0.16.0.jar;%APP_HOME%\lib\simpleclient_hotspot-0.16.0.jar;%APP_HOME%\lib\simpleclient-0.16.0.jar;%APP_HOME%\lib\kotlinx-coroutines-jdk8-1.6.4.jar;%APP_HOME%\lib\kotlinx-coroutines-core-jvm-1.6.4.jar;%APP_HOME%\lib\logging-interceptor-4.10.0.jar;%APP_HOME%\lib\okhttp-4.12.0.jar;%APP_HOME%\lib\okio-jvm-3.6.0.jar;%APP_HOME%\lib\kotlin-stdlib-jdk8-1.9.10.jar;%APP_HOME%\lib\kotlin-stdlib-jdk7-1.9.10.jar;%APP_HOME%\lib\kotlin-stdlib-1.9.22.jar;%APP_HOME%\lib\encoder-1.2.3.jar;%APP_HOME%\lib\netty-tcnative-boringssl-static-2.0.62.Final.jar;%APP_HOME%\lib\opentelemetry-semconv-1.23.1-alpha.jar;%APP_HOME%\lib\org.jupnp-2.7.1.jar;%APP_HOME%\lib\org.jupnp.support-2.7.1.jar;%APP_HOME%\lib\failureaccess-1.0.2.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\checker-qual-3.41.0.jar;%APP_HOME%\lib\error_prone_annotations-2.23.0.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\rxjava-2.2.21.jar;%APP_HOME%\lib\reactor-core-3.4.24.jar;%APP_HOME%\lib\reactive-streams-1.0.4.jar;%APP_HOME%\lib\netty-codec-dns-4.1.104.Final.jar;%APP_HOME%\lib\netty-codec-socks-4.1.104.Final.jar;%APP_HOME%\lib\netty-codec-4.1.104.Final.jar;%APP_HOME%\lib\netty-transport-4.1.104.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.104.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.104.Final.jar;%APP_HOME%\lib\netty-common-4.1.104.Final.jar;%APP_HOME%\lib\framework-1.3.2.jar;%APP_HOME%\lib\framework-internal-1.3.2.jar;%APP_HOME%\lib\gson-fire-1.8.5.jar;%APP_HOME%\lib\gson-2.10.1.jar;%APP_HOME%\lib\commons-net-3.9.0.jar;%APP_HOME%\lib\opentelemetry-context-1.33.0.jar;%APP_HOME%\lib\tuples-4.10.3.jar;%APP_HOME%\lib\jnr-unixsocket-0.38.17.jar;%APP_HOME%\lib\ens-normalize-0.1.2.jar;%APP_HOME%\lib\plexus-utils-3.5.1.jar;%APP_HOME%\lib\simpleclient_tracer_otel-0.16.0.jar;%APP_HOME%\lib\simpleclient_tracer_otel_agent-0.16.0.jar;%APP_HOME%\lib\jnr-enxio-0.32.13.jar;%APP_HOME%\lib\jnr-posix-3.1.15.jar;%APP_HOME%\lib\jnr-ffi-2.2.13.jar;%APP_HOME%\lib\commons-codec-1.16.0.jar;%APP_HOME%\lib\annotations-13.0.jar;%APP_HOME%\lib\perfmark-api-0.26.0.jar;%APP_HOME%\lib\annotations-4.1.1.4.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.23.jar;%APP_HOME%\lib\netty-tcnative-classes-2.0.62.Final.jar;%APP_HOME%\lib\netty-codec-haproxy-4.1.104.Final.jar;%APP_HOME%\lib\netty-codec-memcache-4.1.104.Final.jar;%APP_HOME%\lib\netty-codec-mqtt-4.1.104.Final.jar;%APP_HOME%\lib\netty-codec-redis-4.1.104.Final.jar;%APP_HOME%\lib\netty-codec-smtp-4.1.104.Final.jar;%APP_HOME%\lib\netty-codec-stomp-4.1.104.Final.jar;%APP_HOME%\lib\netty-codec-xml-4.1.104.Final.jar;%APP_HOME%\lib\netty-handler-ssl-ocsp-4.1.104.Final.jar;%APP_HOME%\lib\netty-transport-rxtx-4.1.104.Final.jar;%APP_HOME%\lib\netty-transport-sctp-4.1.104.Final.jar;%APP_HOME%\lib\netty-transport-udt-4.1.104.Final.jar;%APP_HOME%\lib\client-java-proto-18.0.1.jar;%APP_HOME%\lib\snakeyaml-2.0.jar;%APP_HOME%\lib\commons-compress-1.25.0.jar;%APP_HOME%\lib\commons-io-2.15.1.jar;%APP_HOME%\lib\protobuf-java-3.22.0.jar;%APP_HOME%\lib\commons-collections4-4.4.jar;%APP_HOME%\lib\ST4-4.3.4.jar;%APP_HOME%\lib\antlr-runtime-3.5.3.jar;%APP_HOME%\lib\org.abego.treelayout.core-1.0.3.jar;%APP_HOME%\lib\javax.json-1.1.4.jar;%APP_HOME%\lib\icu4j-71.1.jar;%APP_HOME%\lib\jnr-constants-0.10.3.jar;%APP_HOME%\lib\simpleclient_tracer_common-0.16.0.jar;%APP_HOME%\lib\jffi-1.3.10.jar;%APP_HOME%\lib\jffi-1.3.10-native.jar;%APP_HOME%\lib\asm-commons-9.2.jar;%APP_HOME%\lib\asm-util-9.2.jar;%APP_HOME%\lib\asm-analysis-9.2.jar;%APP_HOME%\lib\asm-tree-9.2.jar;%APP_HOME%\lib\asm-9.2.jar;%APP_HOME%\lib\jnr-a64asm-1.0.0.jar;%APP_HOME%\lib\jnr-x86asm-1.0.2.jar;%APP_HOME%\lib\javax.persistence-api-2.2.jar;%APP_HOME%\lib\javax.annotation-api-1.3.2.jar;%APP_HOME%\lib\swagger-annotations-1.6.9.jar


@rem Execute besu-untuned
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %BESU_UNTUNED_OPTS%  -classpath "%CLASSPATH%" org.hyperledger.besu.Besu %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable BESU_UNTUNED_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%BESU_UNTUNED_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
