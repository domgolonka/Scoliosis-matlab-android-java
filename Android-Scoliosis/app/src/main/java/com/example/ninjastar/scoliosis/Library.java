package com.example.ninjastar.scoliosis;

import java.util.Locale;

import android.app.Activity;
import android.app.ActionBar;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Context;
import android.content.Intent;
import android.support.v13.app.FragmentPagerAdapter;
import android.os.Bundle;
import android.support.v4.view.ViewPager;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;


public class Library extends Activity {

    public final static String EXTRA_MESSAGE = "com.example.ninjastar.scoliosis.MESSAGE";


    /**
     * The {@link android.support.v4.view.PagerAdapter} that will provide
     * fragments for each of the sections. We use a
     * {@link FragmentPagerAdapter} derivative, which will keep every
     * loaded fragment in memory. If this becomes too memory intensive, it
     * may be best to switch to a
     * {@link android.support.v13.app.FragmentStatePagerAdapter}.
     */

    /**
     * The {@link ViewPager} that will host the section contents.
     */
    ViewPager mViewPager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_library);

        //Implement list

        final ListView listView = (ListView) findViewById(R.id.list);

        final String[] testStrings = {"String 1", "String 2", "String 3"}; //TODEL

        //Build the list of files
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, android.R.id.text1, fileList());
        listView.setAdapter(adapter);

        //Action for when and item in the list is clicked


        AdapterView.OnItemClickListener listener = new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                String imageName = (String) parent.getItemAtPosition(position);
                Intent intent = new Intent(Library.this, viewImage.class); //Intent to move to viewImage activity
                intent.putExtra(EXTRA_MESSAGE, imageName);
                startActivity(intent);
            }
        };

        listView.setOnItemClickListener(listener);
    }


    /*
    Transition to the LoginActivity screen one click of Measure New Image button
     */

    public void sendMessage(View view){
        Intent intent = new Intent(this, LoginActivity.class);
        startActivity(intent);
    }


    /*
    Open imagesavetest Activity TODEL
     */

    public void openGallery(View view){
        Intent intent = new Intent(this, imagesavetest.class);
        startActivity(intent);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_library, menu);
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
