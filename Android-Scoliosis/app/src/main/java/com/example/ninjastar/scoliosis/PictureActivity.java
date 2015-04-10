package com.example.ninjastar.scoliosis;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.Map;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

public class PictureActivity extends Activity {

    Button btnLoadImage, btnResetImage;
    TextView textSource;
    ImageView imageResult;
    Canvas canvasMaster;

    private Bitmap bmp;
    int x,y;

    private static final int REQUEST_CODE = 1;

    final int maxclicked = 5;
    int clicked = 0;
    Map<Integer,Coords> coordinates = new LinkedHashMap<Integer, Coords>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_picture);

        //Open the gallery to load the pictre
        Intent intent = new Intent();
        intent.setType("image/*");
        intent.setAction(Intent.ACTION_GET_CONTENT);
        startActivityForResult(Intent.createChooser(intent, "Select Picture"), REQUEST_CODE);


        btnLoadImage = (Button)findViewById(R.id.donePicture);
        textSource = (TextView)findViewById(R.id.progress_text);
        imageResult = (ImageView)findViewById(R.id.editPicture_points);
        btnResetImage = (Button)findViewById(R.id.resetPicture);



        btnLoadImage.setOnClickListener(new OnClickListener() {

            @Override
            public void onClick(View arg0) {
                if (clicked >= 5) {
                    String FILENAME = "coordinates";
                    try {
                        FileOutputStream fos = openFileOutput(FILENAME, Context.MODE_PRIVATE);
                        Log.d("COORDINATE: ", coordinates.toString());
                        fos.write(coordinates.toString().getBytes());
                        fos.close();
                    } catch (FileNotFoundException e) {
                        e.getMessage();
                    } catch (IOException e) {
                        e.getMessage();
                    }

                } else {
                    alert("You need to enter " + (maxclicked - clicked) + " more coordinates");
                }
            }
        });
        btnResetImage.setOnClickListener(new OnClickListener() {

            @Override
            public void onClick(View arg0) {
                coordinates.clear();
                clicked =0;
            }
        });
        imageResult.setOnTouchListener(new OnTouchListener() {

            @Override
            public boolean onTouch(View v, MotionEvent event) {

                int action = event.getAction();
                int[] rate = getBitmapOffset(imageResult, true);
                x = (int) event.getX() - rate[1];
                y = (int) event.getY() - rate[0];

                switch (action) {
                    case MotionEvent.ACTION_DOWN:
                        textSource.setText("X" + x + " : Y " + y);
                        break;
                    case MotionEvent.ACTION_MOVE:
                        textSource.setText("X" + x + " : Y " + y);
                        break;
                    case MotionEvent.ACTION_UP:
                        drawOnProjectedBitMap((ImageView)v, bmp, (int)event.getX(), (int)event.getY());
                        clicked++;
                        coordinates.put(clicked, new Coords(x, y));
                        //textSource.setText("Please click on the vertebrae " + (maxclicked-clicked) + " more times");
                        textSource.setText("X" + x + " : Y " + y);
                        imageResult.invalidate();
                        break;
                }

                return true;
            }});
    }
    public static int[] getBitmapOffset(ImageView img,  Boolean includeLayout) {
        int[] offset = new int[2];
        float[] values = new float[9];

        Matrix m = img.getImageMatrix();
        m.getValues(values);

        offset[0] = (int) values[5];
        offset[1] = (int) values[2];

        if (includeLayout) {
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) img.getLayoutParams();
            int paddingTop = (int) (img.getPaddingTop() );
            int paddingLeft = (int) (img.getPaddingLeft() );

            offset[0] += paddingTop + lp.topMargin;
            offset[1] += paddingLeft + lp.leftMargin;
        }
        return offset;
    }

    private void alert(String text) {
        AlertDialog ad = new AlertDialog.Builder(this).create();
        ad.setCancelable(true);
        ad.setMessage(text);
        ad.show();
    }
    /*
     * Project position on ImageView to position on Bitmap
     * draw on it
     */
    private void drawOnProjectedBitMap(ImageView iv, Bitmap bm, int x, int y){
        if(x<0 || y<0 || x > iv.getWidth() || y > iv.getHeight()){
            //outside ImageView
            return;
        }else{
            int projectedX = (int)((double)x * ((double)bm.getWidth()/((double)iv.getWidth())));
            int projectedY = (int)((double)y * ((double)bm.getHeight()/((double)iv.getHeight())));

            Paint   paint = new Paint();
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(Color.RED);
            paint.setStrokeWidth(3);
            canvasMaster.drawCircle(projectedX, projectedY, 5, paint);
            imageResult.invalidate();
            Log.d("WIDTH", String.valueOf(x) + " " + bm.getWidth() + " " + iv.getWidth());
            Log.d("HEIGHT", String.valueOf(y) + " " + bm.getHeight() + " " + iv.getHeight());
        }
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        //This loads the picture into the bitmap object so it can be set as the imageView
        Bitmap tempBitmap;
        InputStream stream = null;
        if (requestCode == REQUEST_CODE && resultCode == Activity.RESULT_OK)
            try {
                // recyle unused bitmaps
                if (bmp != null) {
                    bmp.recycle();
                }
                stream = getContentResolver().openInputStream(data.getData());
                tempBitmap = BitmapFactory.decodeStream(stream);


                //bitmapMaster is Mutable bitmap
                bmp = Bitmap.createBitmap(
                        tempBitmap.getWidth(),
                        tempBitmap.getHeight(),
                        Bitmap.Config.ARGB_8888);

                canvasMaster = new Canvas(bmp);
                canvasMaster.drawBitmap(tempBitmap, 0, 0, null);

                imageResult.setImageBitmap(bmp);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } finally {
                if (stream != null)
                    try {
                        stream.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
            }
    }


    static class Coords {
        int xx;
        int yy;

        public boolean equals(Object o) {
            Coords c = (Coords) o;
            return c.xx == xx && c.yy == yy;
        }

        public Coords(int x, int y) {
            super();
            this.xx = x;
            this.yy = y;
        }

        public int hashCode() {
            return new Integer(xx + "0" + yy);
        }
        public String toString()
        {
            return xx + " " + yy;
        }
    }


}
