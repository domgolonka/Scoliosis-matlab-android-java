[33mcommit c5ee647b29d2e80685933eeae361a5b8019d1ae8[m
Author: dtg <dtg@sfu.ca>
Date:   Fri Apr 10 13:22:01 2015 -0700

    android

[1mdiff --git a/Android-Scoliosis/.idea/gradle.xml b/Android-Scoliosis/.idea/gradle.xml[m
[1mindex fe865d3..c595ad9 100644[m
[1m--- a/Android-Scoliosis/.idea/gradle.xml[m
[1m+++ b/Android-Scoliosis/.idea/gradle.xml[m
[36m@@ -6,6 +6,7 @@[m
         <option name="distributionType" value="LOCAL" />[m
         <option name="externalProjectPath" value="$PROJECT_DIR$" />[m
         <option name="gradleHome" value="$APPLICATION_HOME_DIR$/gradle/gradle-2.2.1" />[m
[32m+[m[32m        <option name="gradleJvm" value="1.8" />[m
         <option name="modules">[m
           <set>[m
             <option value="$PROJECT_DIR$" />[m
[36m@@ -15,5 +16,4 @@[m
       </GradleProjectSettings>[m
     </option>[m
   </component>[m
[31m-</project>[m
[31m-[m
[32m+[m[32m</project>[m
\ No newline at end of file[m
[1mdiff --git a/Android-Scoliosis/.idea/modules.xml b/Android-Scoliosis/.idea/modules.xml[m
[1mindex 7f26171..abdea47 100644[m
[1m--- a/Android-Scoliosis/.idea/modules.xml[m
[1m+++ b/Android-Scoliosis/.idea/modules.xml[m
[36m@@ -6,5 +6,4 @@[m
       <module fileurl="file://$PROJECT_DIR$/app/app.iml" filepath="$PROJECT_DIR$/app/app.iml" />[m
     </modules>[m
   </component>[m
[31m-</project>[m
[31m-[m
[32m+[m[32m</project>[m
\ No newline at end of file[m
[1mdiff --git a/Android-Scoliosis/Android-Scoliosis.iml b/Android-Scoliosis/Android-Scoliosis.iml[m
[1mindex 0bb6048..c13a442 100644[m
[1m--- a/Android-Scoliosis/Android-Scoliosis.iml[m
[1m+++ b/Android-Scoliosis/Android-Scoliosis.iml[m
[36m@@ -1,9 +1,10 @@[m
 <?xml version="1.0" encoding="UTF-8"?>[m
[31m-<module external.linked.project.path="$MODULE_DIR$" external.root.project.path="$MODULE_DIR$" external.system.id="GRADLE" external.system.module.group="" external.system.module.version="unspecified" type="JAVA_MODULE" version="4">[m
[32m+[m[32m<module external.linked.project.id="Android-Scoliosis" external.linked.project.path="$MODULE_DIR$" external.root.project.path="$MODULE_DIR$" external.system.id="GRADLE" external.system.module.group="" external.system.module.version="unspecified" type="JAVA_MODULE" version="4">[m
   <component name="FacetManager">[m
     <facet type="java-gradle" name="Java-Gradle">[m
       <configuration>[m
         <option name="BUILD_FOLDER_PATH" value="$MODULE_DIR$/build" />[m
[32m+[m[32m        <option name="BUILDABLE" value="false" />[m
       </configuration>[m
     </facet>[m
   </component>[m
[36m@@ -15,5 +16,4 @@[m
     <orderEntry type="inheritedJdk" />[m
     <orderEntry type="sourceFolder" forTests="false" />[m
   </component>[m
[31m-</module>[m
[31m-[m
[32m+[m[32m</module>[m
\ No newline at end of file[m
[1mdiff --git a/Android-Scoliosis/app/app.iml b/Android-Scoliosis/app/app.iml[m
[1mindex c8e03ee..089a5a9 100644[m
[1m--- a/Android-Scoliosis/app/app.iml[m
[1m+++ b/Android-Scoliosis/app/app.iml[m
[36m@@ -1,5 +1,5 @@[m
 <?xml version="1.0" encoding="UTF-8"?>[m
[31m-<module external.linked.project.path="$MODULE_DIR$" external.root.project.path="$MODULE_DIR$/.." external.system.id="GRADLE" external.system.module.group="Android-Scoliosis" external.system.module.version="unspecified" type="JAVA_MODULE" version="4">[m
[32m+[m[32m<module external.linked.project.id=":app" external.linked.project.path="$MODULE_DIR$" external.root.project.path="$MODULE_DIR$/.." external.system.id="GRADLE" external.system.module.group="Android-Scoliosis" external.system.module.version="unspecified" type="JAVA_MODULE" version="4">[m
   <component name="FacetManager">[m
     <facet type="android-gradle" name="Android-Gradle">[m
       <configuration>[m
[36m@@ -12,8 +12,9 @@[m
         <option name="SELECTED_TEST_ARTIFACT" value="_android_test_" />[m
         <option name="ASSEMBLE_TASK_NAME" value="assembleDebug" />[m
         <option name="COMPILE_JAVA_TASK_NAME" value="compileDebugSources" />[m
[31m-        <option name="ASSEMBLE_TEST_TASK_NAME" value="assembleDebugAndroidTest" />[m
         <option name="SOURCE_GEN_TASK_NAME" value="generateDebugSources" />[m
[32m+[m[32m        <option name="ASSEMBLE_TEST_TASK_NAME" value="assembleDebugAndroidTest" />[m
[32m+[m[32m        <option name="COMPILE_JAVA_TEST_TASK_NAME" value="compileDebugAndroidTestSources" />[m
         <option name="TEST_SOURCE_GEN_TASK_NAME" value="generateDebugAndroidTestSources" />[m
         <option name="ALLOW_USER_CONFIGURATION" value="false" />[m
         <option name="MANIFEST_FILE_RELATIVE_PATH" value="/src/main/AndroidManifest.xml" />[m
[36m@@ -89,5 +90,4 @@[m
     <orderEntry type="library" exported="" name="support-v4-22.0.0" level="project" />[m
     <orderEntry type="library" exported="" name="support-annotations-22.0.0" level="project" />[m
   </component>[m
[31m-</module>[m
[31m-[m
[32m+[m[32m</module>[m
\ No newline at end of file[m
[1mdiff --git a/Android-Scoliosis/app/src/main/AndroidManifest.xml b/Android-Scoliosis/app/src/main/AndroidManifest.xml[m
[1mindex 1db2e5f..428f3c7 100644[m
[1m--- a/Android-Scoliosis/app/src/main/AndroidManifest.xml[m
[1m+++ b/Android-Scoliosis/app/src/main/AndroidManifest.xml[m
[36m@@ -27,6 +27,14 @@[m
         </activity>[m
         -->[m
         <activity[m
[32m+[m[32m            android:name=".PictureActivity"[m
[32m+[m[32m            android:label="@string/app_name" >[m
[32m+[m[32m            <intent-filter>[m
[32m+[m[32m                <action android:name="android.intent.action.MAIN" />[m
[32m+[m[32m                <category android:name="android.intent.category.LAUNCHER" />[m
[32m+[m[32m            </intent-filter>[m
[32m+[m[32m        </activity>[m
[32m+[m[32m        <activity[m
             android:name=".MonitorActivity"[m
             android:screenOrientation="landscape"[m
             android:theme="@android:style/Theme.NoTitleBar.Fullscreen" >[m
[36m@@ -39,16 +47,9 @@[m
         <activity[m
             android:name=".Library"[m
             android:label="@string/title_activity_library" >[m
[31m-            <intent-filter>[m
[31m-                <action android:name="android.intent.action.MAIN" />[m
 [m
[31m-                <category android:name="android.intent.category.LAUNCHER" />[m
[31m-            </intent-filter>[m
[31m-        </activity>[m
[31m-        <activity[m
[31m-            android:name=".imagesavetest"[m
[31m-            android:label="@string/title_activity_imagesavetest" >[m
         </activity>[m
[32m+[m
     </application>[m
 [m
 </manifest>[m
[1mdiff --git a/Android-Scoliosis/app/src/main/java/com/example/ninjastar/scoliosis/PictureActivity.java b/Android-Scoliosis/app/src/main/java/com/example/ninjastar/scoliosis/PictureActivity.java[m
[1mindex 5bd9771..91fe66c 100644[m
[1m--- a/Android-Scoliosis/app/src/main/java/com/example/ninjastar/scoliosis/PictureActivity.java[m
[1m+++ b/Android-Scoliosis/app/src/main/java/com/example/ninjastar/scoliosis/PictureActivity.java[m
[36m@@ -1,18 +1,239 @@[m
 package com.example.ninjastar.scoliosis;[m
 [m
[31m-import android.app.Activity;[m
[32m+[m[32mimport java.io.FileNotFoundException;[m
[32m+[m[32mimport java.io.FileOutputStream;[m
[32m+[m[32mimport java.io.IOException;[m
[32m+[m[32mimport java.io.InputStream;[m
[32m+[m[32mimport java.util.LinkedHashMap;[m
[32m+[m[32mimport java.util.Map;[m
[32m+[m
[32m+[m[32mimport android.app.AlertDialog;[m
[32m+[m[32mimport android.content.Context;[m
[32m+[m[32mimport android.graphics.Color;[m
[32m+[m[32mimport android.graphics.Matrix;[m
[32m+[m[32mimport android.graphics.Paint;[m
[32m+[m[32mimport android.graphics.PorterDuff;[m
 import android.os.Bundle;[m
[31m-import android.view.Menu;[m
[31m-import android.view.MenuItem;[m
[32m+[m[32mimport android.app.Activity;[m
[32m+[m[32mimport android.content.Intent;[m
[32m+[m[32mimport android.graphics.Bitmap;[m
[32m+[m[32mimport android.graphics.BitmapFactory;[m
[32m+[m[32mimport android.graphics.Canvas;[m
[32m+[m[32mimport android.util.Log;[m
[32m+[m[32mimport android.view.MotionEvent;[m
[32m+[m[32mimport android.view.View;[m
[32m+[m[32mimport android.view.View.OnClickListener;[m
[32m+[m[32mimport android.view.View.OnTouchListener;[m
[32m+[m[32mimport android.view.ViewGroup;[m
[32m+[m[32mimport android.widget.Button;[m
[32m+[m[32mimport android.widget.ImageView;[m
[32m+[m[32mimport android.widget.TextView;[m
 [m
[31m-/**[m
[31m- * Created by domz on 09/04/15.[m
[31m- */[m
 public class PictureActivity extends Activity {[m
[32m+[m
[32m+[m[32m    Button btnLoadImage, btnResetImage;[m
[32m+[m[32m    TextView textSource;[m
[32m+[m[32m    ImageView imageResult;[m
[32m+[m[32m    Canvas canvasMaster;[m
[32m+[m
[32m+[m[32m    private Bitmap bmp;[m
[32m+[m[32m    int x,y;[m
[32m+[m
[32m+[m[32m    private static final int REQUEST_CODE = 1;[m
[32m+[m
[32m+[m[32m    final int maxclicked = 5;[m
[32m+[m[32m    int clicked = 0;[m
[32m+[m[32m    Map<Integer,Coords> coordinates = new LinkedHashMap<Integer, Coords>();[m
[32m+[m
     @Override[m
     protected void onCreate(Bundle savedInstanceState) {[m
         super.onCreate(savedInstanceState);[m
         setContentView(R.layout.activity_picture);[m
[31m-        [m
[32m+[m
[32m+[m[32m        //Open the gallery to load the pictre[m
[32m+[m[32m        Intent intent = new Intent();[m
[32m+[m[32m        intent.setType("image/*");[m
[32m+[m[32m        intent.setAction(Intent.ACTION_GET_CONTENT);[m
[32m+[m[32m        startActivityForResult(Intent.createChooser(intent, "Select Picture"), REQUEST_CODE);[m
[32m+[m
[32m+[m
[32m+[m[32m        btnLoadImage = (Button)findViewById(R.id.donePicture);[m
[32m+[m[32m        textSource = (TextView)findViewById(R.id.progress_text);[m
[32m+[m[32m        imageResult = (ImageView)findViewById(R.id.editPicture_points);[m
[32m+[m[32m        btnResetImage = (Button)findViewById(R.id.resetPicture);[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m        btnLoadImage.setOnClickListener(new OnClickListener() {[m
[32m+[m
[32m+[m[32m            @Override[m
[32m+[m[32m            public void onClick(View arg0) {[m
[32m+[m[32m                if (clicked >= 5) {[m
[32m+[m[32m                    String FILENAME = "coordinates";[m
[32m+[m[32m                    try {[m
[32m+[m[32m                        FileOutputStream fos = openFileOutput(FILENAME, Context.MODE_PRIVATE);[m
[32m+[m[32m                        Log.d("COORDINATE: ", coordinates.toString());[m
[32m+[m[32m                        fos.write(coordinates.toString().getBytes());[m
[32m+[m[32m                        fos.close();[m
[32m+[m[32m                    } catch (FileNotFoundException e) {[m
[32m+[m[32m                        e.getMessage();[m
[32m+[m[32m                    } catch (IOException e) {[m
[32m+[m[32m                        e.getMessage();[m
[32m+[m[32m                    }[m
[32m+[m
[32m+[m[32m                } else {[m
[32m+[m[32m                    alert("You need to enter " + (maxclicked - clicked) + " more coordinates");[m
[32m+[m[32m                }[m
[32m+[m[32m            }[m
[32m+[m[32m        });[m
[32m+[m[32m        btnResetImage.setOnClickListener(new OnClickListener() {[m
[32m+[m
[32m+[m[32m            @Override[m
[32m+[m[32m            public void onClick(View arg0) {[m
[32m+[m[32m                coordinates.clear();[m
[32m+[m[32m                clicked =0;[m
[32m+[m[32m            }[m
[32m+[m[32m        });[m
[32m+[m[32m        imageResult.setOnTouchListener(new OnTouchListener() {[m
[32m+[m
[32m+[m[32m            @Override[m
[32m+[m[32m            public boolean onTouch(View v, MotionEvent event) {[m
[32m+[m
[32m+[m[32m                int action = event.getAction();[m
[32m+[m[32m                int[] rate = getBitmapOffset(imageResult, true);[m
[32m+[m[32m                x = (int) event.getX() - rate[1];[m
[32m+[m[32m                y = (int) event.getY() - rate[0];[m
[32m+[m
[32m+[m[32m                switch (action) {[m
[32m+[m[32m                    case MotionEvent.ACTION_DOWN:[m
[32m+[m[32m                        textSource.setText("X" + x + " : Y " + y);[m
[32m+[m[32m                        break;[m
[32m+[m[32m                    case MotionEvent.ACTION_MOVE:[m
[32m+[m[32m                        textSource.setText("X" + x + " : Y " + y);[m
[32m+[m[32m                        break;[m
[32m+[m[32m                    case MotionEvent.ACTION_UP:[m
[32m+[m[32m                        drawOnProjectedBitMap((ImageView)v, bmp, (int)event.getX(), (int)event.getY());[m
[32m+[m[32m                        clicked++;[m
[32m+[m[32m                        coordinates.put(clicked, new Coords(x, y));[m
[32m+[m[32m                        //textSource.setText("Please click on the vertebrae " + (maxclicked-clicked) + " more times");[m
[32m+[m[32m                        textSource.setText("X" + x + " : Y " + y);[m
[32m+[m[32m                        imageResult.invalidate();[m
[32m+[m[32m                        break;[m
[32m+[m[32m                }[m
[32m+[m
[32m+[m[32m                return true;[m
[32m+[m[32m            }});[m
[32m+[m[32m    }[m
[32m+[m[32m    public static int[] getBitmapOffset(ImageView img,  Boolean includeLayout) {[m
[32m+[m[32m        int[] offset = new int[2];[m
[32m+[m[32m        float[] values = new float[9];[m
[32m+[m
[32m+[m[32m        Matrix m = img.getImageMatrix();[m
[32m+[m[32m        m.getValues(values);[m
[32m+[m
[32m+[m[32m        offset[0] = (int) values[5];[m
[32m+[m[32m        offset[1] = (int) values[2];[m
[32m+[m
[32m+[m[32m        if (includeLayout) {[m
[32m+[m[32m            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) img.getLayoutParams();[m
[32m+[m[32m            int paddingTop = (int) (img.getPaddingTop() );[m
[32m+[m[32m            int paddingLeft = (int) (img.getPaddingLeft() );[m
[32m+[m
[32m+[m[32m            offset[0] += paddingTop + lp.topMargin;[m
[32m+[m[32m            offset[1] += paddingLeft + lp.leftMargin;[m
[32m+[m[32m        }[m
[32m+[m[32m        return offset;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    private void alert(String text) {[m
[32m+[m[32m        AlertDialog ad = new AlertDialog.Builder(this).create();[m
[32m+[m[32m        ad.setCancelable(true);[m
[32m+[m[32m        ad.setMessage(text);[m
[32m+[m[32m        ad.show();[m
[32m+[m[32m    }[m
[32m+[m[32m    /*[m
[32m+[m[32m     * Project position on ImageView to position on Bitmap[m
[32m+[m[32m     * draw on it[m
[32m+[m[32m     */[m
[32m+[m[32m    private void drawOnProjectedBitMap(ImageView iv, Bitmap bm, int x, int y){[m
[32m+[m[32m        if(x<0 || y<0 || x > iv.getWidth() || y > iv.getHeight()){[m
[32m+[m[32m            //outside ImageView[m
[32m+[m[32m            return;[m
[32m+[m[32m        }else{[m
[32m+[m[32m            int projectedX = (int)((double)x * ((double)bm.getWidth()/((double)iv.getWidth())));[m
[32m+[m[32m            int projectedY = (int)((double)y * ((double)bm.getHeight()/((double)iv.getHeight())));[m
[32m+[m
[32m+[m[32m            Paint   paint = new Paint();[m
[32m+[m[32m            paint.setStyle(Paint.Style.FILL);[m
[32m+[m[32m            paint.setColor(Color.RED);[m
[32m+[m[32m            paint.setStrokeWidth(3);[m
[32m+[m[32m            canvasMaster.drawCircle(projectedX, projectedY, 5, paint);[m
[32m+[m[32m            imageResult.invalidate();[m
[32m+[m[32m            Log.d("WIDTH", String.valueOf(x) + " " + bm.getWidth() + " " + iv.getWidth());[m
[32m+[m[32m            Log.d("HEIGHT", String.valueOf(y) + " " + bm.getHeight() + " " + iv.getHeight());[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m[32m    @Override[m
[32m+[m[32m    protected void onActivityResult(int requestCode, int resultCode, Intent data) {[m
[32m+[m[32m        //This loads the picture into the bitmap object so it can be set as the imageView[m
[32m+[m[32m        Bitmap tempBitmap;[m
[32m+[m[32m        InputStream stream = null;[m
[32m+[m[32m        if (requestCode == REQUEST_CODE && resultCode == Activity.RESULT_OK)[m
[32m+[m[32m            try {[m
[32m+[m[32m                // recyle unused bitmaps[m
[32m+[m[32m                if (bmp != null) {[m
[32m+[m[32m                    bmp.recycle();[m
[32m+[m[32m                }[m
[32m+[m[32m                stream = getContentResolver().openInputStream(data.getData());[m
[32m+[m[32m                tempBitmap = BitmapFactory.decodeStream(stream);[m
[32m+[m
[32m+[m
[32m+[m[32m                //bitmapMaster is Mutable bitmap[m
[32m+[m[32m                bmp = Bitmap.createBitmap([m
[32m+[m[32m                        tempBitmap.getWidth(),[m
[32m+[m[32m                        tempBitmap.getHeight(),[m
[32m+[m[32m                        Bitmap.Config.ARGB_8888);[m
[32m+[m
[32m+[m[32m                canvasMaster = new Canvas(bmp);[m
[32m+[m[32m                canvasMaster.drawBitmap(tempBitmap, 0, 0, null);[m
[32m+[m
[32m+[m[32m                imageResult.setImageBitmap(bmp);[m
[32m+[m[32m            } catch (FileNotFoundException e) {[m
[32m+[m[32m                e.printStackTrace();[m
[32m+[m[32m            } finally {[m
[32m+[m[32m                if (stream != null)[m
[32m+[m[32m                    try {[m
[32m+[m[32m                        stream.close();[m
[32m+[m[32m                    } catch (IOException e) {[m
[32m+[m[32m                        e.printStackTrace();[m
[32m+[m[32m                    }[m
[32m+[m[32m            }[m
     }[m
[32m+[m
[32m+[m
[32m+[m[32m    static class Coords {[m
[32m+[m[32m        int xx;[m
[32m+[m[32m        int yy;[m
[32m+[m
[32m+[m[32m        public boolean equals(Object o) {[m
[32m+[m[32m            Coords c = (Coords) o;[m
[32m+[m[32m            return c.xx == xx && c.yy == yy;[m
[32m+[m[32m        }[m
[32m+[m
[32m+[m[32m        public Coords(int x, int y) {[m
[32m+[m[32m            super();[m
[32m+[m[32m            this.xx = x;[m
[32m+[m[32m            this.yy = y;[m
[32m+[m[32m        }[m
[32m+[m
[32m+[m[32m        public int hashCode() {[m
[32m+[m[32m            return new Integer(xx + "0" + yy);[m
[32m+[m[32m        }[m
[32m+[m[32m        public String toString()[m
[32m+[m[32m        {[m
[32m+[m[32m            return xx + " " + yy;[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m
 }[m
[1mdiff --git a/Android-Scoliosis/app/src/main/res/drawable/red_dot.png b/Android-Scoliosis/app/src/main/res/drawable/red_dot.png[m
[1mnew file mode 100644[m
[1mindex 0000000..9886fe4[m
Binary files /dev/null and b/Android-Scoliosis/app/src/main/res/drawable/red_dot.png differ
[1mdiff --git a/Android-Scoliosis/app/src/main/res/layout/activity_picture.xml b/Android-Scoliosis/app/src/main/res/layout/activity_picture.xml[m
[1mindex c56dac6..6843823 100644[m
[1m--- a/Android-Scoliosis/app/src/main/res/layout/activity_picture.xml[m
[1m+++ b/Android-Scoliosis/app/src/main/res/layout/activity_picture.xml[m
[36m@@ -12,7 +12,13 @@[m
             android:layout_height="wrap_content"[m
             android:text="Done"[m
             android:id="@+id/donePicture"[m
[31m-            android:layout_gravity="center_horizontal|bottom" />[m
[32m+[m[32m            android:layout_gravity="center_horizontal|bottom"/>[m
[32m+[m[32m        <Button[m
[32m+[m[32m            android:layout_width="wrap_content"[m
[32m+[m[32m            android:layout_height="wrap_content"[m
[32m+[m[32m            android:text="Restart"[m
[32m+[m[32m            android:id="@+id/resetPicture"[m
[32m+[m[32m            android:layout_gravity="bottom|center_horizontal|right" />[m
 [m
         <ImageView[m
             android:layout_width="match_parent"[m
[36m@@ -20,11 +26,11 @@[m
             android:id="@+id/editPicture_points"[m
             android:layout_gravity="center" />[m
 [m
[31m-        <ProgressBar[m
[31m-            style="?android:attr/progressBarStyleHorizontal"[m
[31m-            android:layout_width="300dp"[m
[31m-            android:layout_height="wrap_content"[m
[31m-            android:id="@+id/progressBar"[m
[32m+[m[32m        <EditText[m
[32m+[m[32m            android:layout_width="match_parent"[m
[32m+[m[32m            android:layout_height="54dp"[m
[32m+[m[32m            android:id="@+id/progress_text"[m
             android:layout_gravity="center_horizontal|top" />[m
[32m+[m
     </FrameLayout>[m
 </LinearLayout>[m
\ No newline at end of file[m
[1mdiff --git a/Matlab-Scoliosis/Connection/ServerStart.m b/Matlab-Scoliosis/Connection/ServerStart.m[m
[1mindex acdbf7e..f521d60 100644[m
[1m--- a/Matlab-Scoliosis/Connection/ServerStart.m[m
[1m+++ b/Matlab-Scoliosis/Connection/ServerStart.m[m
[36m@@ -13,7 +13,7 @@[m [mfunction stInfo = ServerStart(Port)[m
 [m
 %% checkout input argument[m
 if nargin < 1[m
[31m-    error('empty argument');[m
[32m+[m[32merror('empty argument');[m
 end[m
 [m
 %display(sprintf('Start server. IP: %s, Port: %d ', char(java.net.Inet4Address.getLocalHost.getHostAddress), Port));[m
