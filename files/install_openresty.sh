cd /usr/local/src/
wget https://openresty.org/download/openresty-1.11.2.3.tar.gz
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.40.tar.gz
wget https://www.openssl.org/source/openssl-1.0.2k.tar.gz
tar -xvzf openresty-1.11.2.3.tar.gz
tar -xvzf openssl-1.0.2k.tar.gz
tar -xvzf pcre-8.40.tar.gz
cd openssl-1.0.2k/
patch -p1 < ../openresty-1.11.2.3/patches/openssl-1.0.2h-sess_set_get_cb_yield.patch
cd ../openresty-1.11.2.3
./configure --with-luajit --with-pcre=../pcre-8.40 --with-ipv6 --with-pcre-jit --with-http_ssl_module --with-openssl=../openssl-1.0.2k --without-ngx_devel_kit_module --without-http_echo_module --without-ngx_devel_kit_module --without-http_xss_module --without-http_coolkit_module --without-http_set_misc_module --without-http_form_input_module --without-http_encrypted_session_module --without-http_srcache_module --without-http_lua_module --without-http_lua_upstream_module --without-http_headers_more_module --without-http_array_var_module --without-http_memc_module --without-http_redis2_module --without-http_redis_module --without-http_rds_json_module --without-http_rds_csv_module --with-debug
make
make install
