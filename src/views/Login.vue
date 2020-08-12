<template>
  <v-container class="fill-height" fluid>
    <v-row align="center" justify="center">
      <v-col cols="12" sm="8" md="4">
        <v-card class="elevation-6" tile max-width="500px">
          <v-toolbar color="primary" dark flat>
            <v-toolbar-title>OpenPaaS Login</v-toolbar-title>
          </v-toolbar>
          <v-card-text>
            <v-form id="login-form" @submit.prevent="login">
              <v-text-field
                label="Username"
                name="username"
                v-model="username"
                prepend-icon="mdi-account"
                type="text"
              ></v-text-field>

              <v-text-field
                id="password"
                label="Password"
                name="password"
                v-model="password"
                prepend-icon="mdi-lock"
                type="password"
              ></v-text-field>
            </v-form>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              type="submit"
              color="primary"
              form="login-form"
            >Login</v-btn>
            <v-btn>Cancel</v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { post } from "axios";

export default {
  data: () => ({
    username: null,
    password: null
  }),
  methods: {
    login() {
      post(
        "/api/login",
        {
          username: this.username,
          password: this.password,
          rememberme: "false"
        },
        {
          withCredentials: true
        }
      )
        .then(() => {
          window.location = `/${window.location.hash}`;
        })
        .catch(err => {
          console.log("Error on login", err);
        });
    }
  }
};
</script>
