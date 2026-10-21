package com.example.Varsani.Staff.Store_mrg;

import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.Spinner;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.Varsani.R;
import com.example.Varsani.utils.Urls;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class AddProduct extends AppCompatActivity {

    private EditText edtProductName, edtPrice, edtStock, edtDescription;
    private Spinner spinnerCategory;
    private Button btnSaveProduct;
    private ProgressBar progressBar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_product);

        if (getSupportActionBar() != null) {
            getSupportActionBar().setTitle("Add Product");
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        }

        edtProductName = findViewById(R.id.edt_product_name);
        edtPrice = findViewById(R.id.edt_price);
        edtStock = findViewById(R.id.edt_stock);
        edtDescription = findViewById(R.id.edt_description);
        spinnerCategory = findViewById(R.id.spinner_category);
        btnSaveProduct = findViewById(R.id.btn_save_product);
        progressBar = findViewById(R.id.progress_bar);

        String[] categories = new String[]{"T-Shirts", "Hoodies", "Caps", "Accessories"};
        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_dropdown_item, categories);
        spinnerCategory.setAdapter(adapter);

        btnSaveProduct.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                saveProduct();
            }
        });
    }

    private void saveProduct() {
        final String name = edtProductName.getText().toString().trim();
        final String price = edtPrice.getText().toString().trim();
        final String stock = edtStock.getText().toString().trim();
        final String category = spinnerCategory.getSelectedItem().toString();
        final String desc = edtDescription.getText().toString().trim();

        if (TextUtils.isEmpty(name)) {
            edtProductName.setError("Product name is required");
            return;
        }
        if (TextUtils.isEmpty(price)) {
            edtPrice.setError("Price is required");
            return;
        }
        if (TextUtils.isEmpty(stock)) {
            edtStock.setError("Stock is required");
            return;
        }

        progressBar.setVisibility(View.VISIBLE);
        btnSaveProduct.setEnabled(false);

        StringRequest stringRequest = new StringRequest(Request.Method.POST, Urls.URL_ADD_NEW_PRODUCT,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        progressBar.setVisibility(View.GONE);
                        btnSaveProduct.setEnabled(true);
                        try {
                            JSONObject jsonObject = new JSONObject(response);
                            if (jsonObject.getString("status").equals("1")) {
                                Toast.makeText(AddProduct.this, jsonObject.getString("message"), Toast.LENGTH_SHORT).show();
                                finish();
                            } else {
                                Toast.makeText(AddProduct.this, jsonObject.getString("message"), Toast.LENGTH_SHORT).show();
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                            Toast.makeText(AddProduct.this, "Response parsing error", Toast.LENGTH_SHORT).show();
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        progressBar.setVisibility(View.GONE);
                        btnSaveProduct.setEnabled(true);
                        Toast.makeText(AddProduct.this, "Network error. Please try again.", Toast.LENGTH_SHORT).show();
                    }
                }) {
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();
                params.put("product_name", name);
                params.put("category", category);
                params.put("price", price);
                params.put("stock", stock);
                params.put("description", desc);
                return params;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    @Override
    public boolean onSupportNavigateUp() {
        finish();
        return true;
    }
}
