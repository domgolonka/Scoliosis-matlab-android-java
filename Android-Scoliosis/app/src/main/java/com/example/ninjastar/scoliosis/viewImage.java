package com.example.ninjastar.scoliosis;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;


public class viewImage extends Activity{

    private String FILENAME;
    ImageView imageView;
    Bitmap matlabImage;
    private byte[] data;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_image);

        imageView = (ImageView) findViewById(R.id.oldImageView);
        Button saveButton = (Button) findViewById(R.id.saveImageButton);
        Button retryButton = (Button) findViewById(R.id.retryButton);
        EditText filename = (EditText) findViewById(R.id.filename);


        //Check originating activity. If it is PictureActivity, we will load the image from Matlab.
        //Else we will load the image from internal storage
        Intent intent = getIntent();

        Log.i("viewImage", "EXTRA_MESSAGE is: "+intent.getStringExtra(Library.EXTRA_MESSAGE));

        if(intent.getStringExtra(Library.EXTRA_MESSAGE) == null) {   //Came from PictureActivity
            Log.i("viewImage", "EXTRA_MESSAGE == null if passed");

            data = intent.getByteArrayExtra("imagedata");

            BitmapFactory.Options opt = new BitmapFactory.Options();
            opt.inDither = true;
            opt.inPreferredConfig = Bitmap.Config.ARGB_8888;

            matlabImage = BitmapFactory.decodeByteArray(data, 0, data.length, opt);
            imageView.setImageBitmap(matlabImage);


            //Log.d("DATA IN MATLAB:", matlabImage.toString());
            //Log.d("DATA IN IMAGE:", imageView.toString());

        }

        else{       //Came from Library. Load Image and hide save and retry buttons
            String path = this.getFilesDir() + "/" + intent.getStringExtra(Library.EXTRA_MESSAGE);
            imageView.setImageBitmap(BitmapFactory.decodeFile(path));
            saveButton.setVisibility(View.GONE);
            retryButton.setVisibility(View.GONE);
            filename.setVisibility(View.GONE);
        }


    }

    public void saveImageButton(View view){

        Log.i("viewImage", "saveImageButton has been called");

        EditText filename = (EditText) findViewById(R.id.filename);
        FILENAME = filename.getText().toString();

        Log.i("viewImage", "FILENAME is: "+FILENAME);
        if (FILENAME != null){

            try{
                FileOutputStream fos = openFileOutput(FILENAME, Context.MODE_PRIVATE);
                if(matlabImage != null) {
                    matlabImage.compress(Bitmap.CompressFormat.PNG, 100, fos);
                }
                else{
                    Log.i("viewImage", "matlabImage is null");
                }
                fos.close();
            }
            catch (FileNotFoundException e){
                e.getMessage();
            }
            catch (IOException e){
                e.getMessage();
            }
            Intent intent = new Intent(this, Library.class);
            startActivity(intent);
        }



     }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_view_image, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
