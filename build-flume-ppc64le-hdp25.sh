diff --git a/flume-ng-sources/flume-scribe-source/src/main/java/org/apache/flume/source/scribe/ScribeSource.java b/flume-ng-sources/flume-scribe-source/src/main/java/org/apache/flume/source/scribe/ScribeSource.java
index 92668c5..049e1c3 100644
--- a/flume-ng-sources/flume-scribe-source/src/main/java/org/apache/flume/source/scribe/ScribeSource.java
+++ b/flume-ng-sources/flume-scribe-source/src/main/java/org/apache/flume/source/scribe/ScribeSource.java
@@ -88,8 +88,8 @@ public class ScribeSource extends AbstractSource implements
         Scribe.Processor processor = new Scribe.Processor(new Receiver());
         TNonblockingServerTransport transport = new TNonblockingServerSocket(port);
         THsHaServer.Args args = new THsHaServer.Args(transport);
-        args.minWorkerThreads(workers);
-        args.maxWorkerThreads(workers);
+        args.workerThreads(workers);
+        args.workerThreads(workers);
         args.processor(processor);
         args.transportFactory(new TFramedTransport.Factory());
         args.protocolFactory(new TBinaryProtocol.Factory(false, false));
diff --git a/pom.xml b/pom.xml
index 3f537cf..0d54e26 100644
--- a/pom.xml
+++ b/pom.xml
@@ -708,6 +708,23 @@ limitations under the License.
 
   <repositories>
     <repository>
+        <releases>
+            <enabled>true</enabled>
+            <updatePolicy>always</updatePolicy>
+            <checksumPolicy>warn</checksumPolicy>
+        </releases>
+        <snapshots>
+            <enabled>false</enabled>
+            <updatePolicy>never</updatePolicy>
+            <checksumPolicy>fail</checksumPolicy>
+        </snapshots>
+        <id>HDPReleases</id>
+        <name>HDP Releases</name>
+        <url>http://repo.hortonworks.com/content/repositories/releases/</url>
+        <layout>default</layout>
+    </repository>
+
+    <repository>
       <id>${publicrepoid}</id>
       <name>${reponame}</name>
       <url>${repo.maven.org}</url>
@@ -725,7 +742,6 @@ limitations under the License.
         <enabled>false</enabled>
       </snapshots>
     </repository>
-
     <repository>
       <id>repository.jboss.org</id>
       <url>http://repository.jboss.org/nexus/content/groups/public/
@@ -1001,6 +1017,12 @@ limitations under the License.
         <artifactId>avro</artifactId>
         <version>${avro.version}</version>
       </dependency>
+      
+      <dependency>
+        <groupId>org.xerial.snappy</groupId>
+        <artifactId>snappy-java</artifactId>
+        <version>1.1.1</version>
+      </dependency>
 
       <dependency>
         <groupId>org.apache.avro</groupId>
@@ -1099,7 +1121,7 @@ limitations under the License.
       <dependency>
         <groupId>org.apache.hadoop</groupId>
         <artifactId>hadoop-common</artifactId>
-        <version>${hadoop.version}</version>
+        <version>2.7.3.2.5.0.0-1245</version>
         <optional>true</optional>
       </dependency>
 
@@ -1486,4 +1508,4 @@ limitations under the License.
     </plugins>
   </reporting>
 
-</project>
\ No newline at end of file
+</project>
