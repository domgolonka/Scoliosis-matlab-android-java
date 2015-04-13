package com.example.ninjastar.scoliosis;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.hardware.Camera;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;

import com.example.ninjastar.scoliosis.utils.Commands;
import com.example.ninjastar.scoliosis.utils.SocketReceiver;
import com.example.ninjastar.scoliosis.utils.SocketSender;

import java.io.IOException;
import java.net.Socket;
import java.util.concurrent.ExecutionException;

/**
 * Created by domz on 02/04/15.
 */


public class MonitorActivity extends Activity {



    private String _ipAddress;
    private int _port;
    private byte[] data;

    private int CLIENT_PORT;

    private Button _captureButton;
    boolean _start = true;


    private final Thread _captureThread = new Thread( new Runnable() {

        @Override
        public void run() {
            while (listenCapture() == false) {
                try {
                    Thread.sleep(500);
                } catch (InterruptedException e) {
                    Log.d("Thread InterruptedExc", e.getMessage());
                }

            }
            startViewImage();
        }

    });

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_monitor);
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            _ipAddress = extras.getString("ipAddress");
            _port = extras.getInt("port");
            CLIENT_PORT = extras.getInt("CLIENT_PORT");
        }
        runCapture();

    }


    private void startViewImage() {
        Intent intent = new Intent(this, viewImage.class);
        intent.putExtra("imagedata", this.data);
        startActivity(intent);
    }


    private void runCapture() {
        _captureThread.start();
    }


    private boolean listenCapture() {
        boolean capture = false;
        try {
            byte[] i = new SocketReceiver(CLIENT_PORT).execute().get();

            if (i.length == 1) {
                //Log.d("DATA", "THE DATA IS int " + String.valueOf(data));
                int command = i[0];
                capture = command == Commands.SEND_PICTURE;
            }
            else  if (i.length > 1){
                this.data = i;
                //Log.d("DATA", "THE DATA IS byte " + new String(data));
                capture = true;
            }
        } catch (InterruptedException e) {
            alert(e.getMessage());
            Log.d("InterruptedException", e.getMessage());
        } catch (ExecutionException e) {
            alert(e.getMessage());
            Log.d("ExecutionException", e.getMessage());
        } catch (IOException e) {
            alert(e.getMessage());
            Log.d("IOException", e.getMessage());
        }
        return capture;

    }




    private void alert(String text) {
        AlertDialog ad = new AlertDialog.Builder(this).create();
        ad.setCancelable(true);
        ad.setMessage(text);
        ad.show();
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
