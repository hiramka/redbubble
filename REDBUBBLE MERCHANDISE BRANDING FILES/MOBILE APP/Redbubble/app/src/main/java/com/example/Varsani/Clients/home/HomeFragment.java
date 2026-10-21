package com.example.Varsani.Clients.home;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.Varsani.Clients.Adapters.AdapterServices;
import com.example.Varsani.Clients.Models.ServicesModal;
import com.example.Varsani.Clients.Models.UserModel;
import com.example.Varsani.Clients.Profile;
import com.example.Varsani.Clients.ServiceItems;
import com.example.Varsani.Staff.Store_mrg.AddProduct;
import com.example.Varsani.R;
import com.example.Varsani.utils.SessionHandler;
import com.example.Varsani.utils.Urls;
import com.google.android.material.floatingactionbutton.FloatingActionButton;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class HomeFragment extends Fragment {

    private SessionHandler session;
    private UserModel user;
    private List<ServicesModal> list2;
    private AdapterServices adapterServices;
    private ImageView img_profile;
    private View layoutCartBadge;
    private TextView txvCartBadge;
    private RecyclerView recyclerView2;
    private ProgressBar progressBar;

    private EditText edtSearch;
    private TextView chipAll, chipTshirts, chipHoodies, chipCaps;
    private FloatingActionButton fabAddProduct;
    private String selectedCategory = "All";

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {

        View root = inflater.inflate(R.layout.fragment_home, container, false);

        progressBar = root.findViewById(R.id.progressBar);
        recyclerView2 = root.findViewById(R.id.recyclerView2);
        layoutCartBadge = root.findViewById(R.id.layout_cart_badge);
        txvCartBadge = root.findViewById(R.id.txv_cart_badge);
        img_profile = root.findViewById(R.id.img_profile);
        edtSearch = root.findViewById(R.id.edt_search);

        chipAll = root.findViewById(R.id.chip_all);
        chipTshirts = root.findViewById(R.id.chip_tshirts);
        chipHoodies = root.findViewById(R.id.chip_hoodies);
        chipCaps = root.findViewById(R.id.chip_caps);
        fabAddProduct = root.findViewById(R.id.fab_add_product);

        layoutCartBadge.setOnClickListener(v -> {
            Intent intent = new Intent(getContext(), ServiceItems.class);
            startActivity(intent);
        });

        img_profile.setOnClickListener(v -> {
            Intent ght = new Intent(getContext(), Profile.class);
            startActivity(ght);
        });

        fabAddProduct.setOnClickListener(v -> {
            Intent intent = new Intent(getContext(), AddProduct.class);
            startActivity(intent);
        });

        recyclerView2.setLayoutManager(new GridLayoutManager(getContext(), 2));

        session = new SessionHandler(getContext());
        user = session.getUserDetails();
        list2 = new ArrayList<>();

        setupCategoryChips();
        setupLiveSearch();
        getservices();
        getCartCount();

        return root;
    }

    private void setupCategoryChips() {
        chipAll.setOnClickListener(v -> selectCategory("All", chipAll));
        chipTshirts.setOnClickListener(v -> selectCategory("T-Shirts", chipTshirts));
        chipHoodies.setOnClickListener(v -> selectCategory("Hoodies", chipHoodies));
        chipCaps.setOnClickListener(v -> selectCategory("Caps", chipCaps));
    }

    private void selectCategory(String category, TextView selectedChip) {
        selectedCategory = category;

        chipAll.setBackgroundResource(R.drawable.shape_chip_unselected);
        chipAll.setTextColor(getResources().getColor(R.color.text_secondary));
        chipTshirts.setBackgroundResource(R.drawable.shape_chip_unselected);
        chipTshirts.setTextColor(getResources().getColor(R.color.text_secondary));
        chipHoodies.setBackgroundResource(R.drawable.shape_chip_unselected);
        chipHoodies.setTextColor(getResources().getColor(R.color.text_secondary));
        chipCaps.setBackgroundResource(R.drawable.shape_chip_unselected);
        chipCaps.setTextColor(getResources().getColor(R.color.text_secondary));

        selectedChip.setBackgroundResource(R.drawable.shape_chip_selected);
        selectedChip.setTextColor(getResources().getColor(R.color.text_light));

        filterList();
    }

    private void setupLiveSearch() {
        edtSearch.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                filterList();
            }

            @Override
            public void afterTextChanged(Editable s) {}
        });
    }

    private void filterList() {
        if (adapterServices == null) return;

        String query = edtSearch.getText().toString().trim().toLowerCase();
        List<ServicesModal> filtered = new ArrayList<>();

        for (ServicesModal item : list2) {
            boolean matchesCategory = selectedCategory.equals("All") ||
                    item.getCategory().toLowerCase().contains(selectedCategory.toLowerCase());
            boolean matchesSearch = query.isEmpty() ||
                    item.getProductName().toLowerCase().contains(query) ||
                    item.getDesc().toLowerCase().contains(query);

            if (matchesCategory && matchesSearch) {
                filtered.add(item);
            }
        }
        adapterServices.updateList(filtered);
    }


    public void getservices() {
        progressBar.setVisibility(View.VISIBLE);
        StringRequest stringRequest = new StringRequest(Request.Method.POST, Urls.URL_GET_SERVICES,
                response -> {
                    try {
                        Log.e("Response", "" + response);
                        JSONObject jsonObject = new JSONObject(response);
                        String status = jsonObject.getString("status");

                        if (status.equals("1")) {
                            list2.clear();
                            JSONArray jsonArray = jsonObject.getJSONArray("products");
                            for (int i = 0; i < jsonArray.length(); i++) {
                                JSONObject jsn = jsonArray.getJSONObject(i);
                                String productID = jsn.getString("productID");
                                String productName = jsn.getString("productName");
                                String price = jsn.getString("price");
                                String stock = jsn.getString("stock");
                                String image = jsn.getString("image");
                                String desc = jsn.getString("desc");
                                String category = jsn.optString("category", "General");

                                ServicesModal servicesModal = new ServicesModal(productID, productName, stock, price, image, desc, category);
                                list2.add(servicesModal);
                            }
                            progressBar.setVisibility(View.GONE);
                            adapterServices = new AdapterServices(getContext(), list2);
                            recyclerView2.setAdapter(adapterServices);
                            filterList();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        progressBar.setVisibility(View.GONE);
                    }
                }, error -> {
            error.printStackTrace();
            progressBar.setVisibility(View.GONE);
        });

        RequestQueue requestQueue = Volley.newRequestQueue(getContext());
        requestQueue.add(stringRequest);
    }

    private void getCartCount() {
        if (user == null || user.getClientID() == null) return;
        StringRequest stringRequest = new StringRequest(Request.Method.POST, Urls.URL_GET_CART2,
                response -> {
                    try {
                        JSONObject jsonObject = new JSONObject(response);
                        if (jsonObject.getString("status").equals("1")) {
                            JSONArray jsonArray = jsonObject.getJSONArray("cart");
                            int count = jsonArray.length();
                            if (txvCartBadge != null) {
                                txvCartBadge.setText(String.valueOf(count));
                                txvCartBadge.setVisibility(count > 0 ? View.VISIBLE : View.GONE);
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }, error -> {}) {
            @Override
            protected java.util.Map<String, String> getParams() {
                java.util.Map<String, String> params = new java.util.HashMap<>();
                params.put("client_id", user.getClientID());
                return params;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(getContext());
        requestQueue.add(stringRequest);
    }
}
