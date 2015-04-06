package com.example.ninjastar.scoliosis;

import android.app.Activity;
import android.app.AlertDialog;
import android.hardware.Camera;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;

import com.example.ninjastar.scoliosis.utils.Commands;
import com.example.ninjastar.scoliosis.utils.SocketReceiver;
import com.example.ninjastar.scoliosis.utils.SocketSender;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

/**
 * Created by domz on 02/04/15.
 */


public class MonitorActivity extends Activity {

    private Camera _camera;
   // private CameraPreview _mPreview;

    private String _ipAddress;
    private int _port;

    private int CLIENT_PORT;

    private Button _captureButton;
    boolean _start = true;


    private final Thread _captureThread = new Thread( new Runnable() {

        @Override
        public void run() {
            while (listenCapture()) {
                //new CapturePictureTask (_ipAddress, _port).execute(_camera);
                try {
                    // The sleep time should be adjusted
                    Thread.sleep(500);
                } catch (InterruptedException e) {

                }

            }

        }

    });

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            _ipAddress = extras.getString("ipAddress");
            _port = extras.getInt("port");
            CLIENT_PORT = extras.getInt("CLIENT_PORT");
        }
    }




    private void runCapture() {
        _captureThread.start();
    }


    private boolean listenCapture() {
        boolean capture = false;

        try {
            int command = new SocketReceiver(CLIENT_PORT).execute().get();
        } catch (InterruptedException e) {
            alert(e.getMessage());
        } catch (ExecutionException e) {
            alert(e.getMessage());
        } catch (IOException e) {
            alert(e.getMessage());
        }

        return capture;

    }





    @SuppressWarnings("deprecation")
    private void sendCameraStop() {

        if (_captureThread.isAlive()) {
            try {
                _captureThread.stop();
            } catch (Exception e) {
                _captureThread.interrupt();
            }
        }

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
