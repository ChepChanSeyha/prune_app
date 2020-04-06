<template>
  <v-app>
    <v-navigation-drawer v-model="drawer" app dark :mini-variant="miniVariant">
      <v-list>
        <v-subheader>Image</v-subheader>
        <v-list-item-group color="primary">
          <v-list-item v-for="item in items" :key="item.title">
            <v-list-item-icon>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              {{ item.title }}
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar app class="white" height="50">
      <v-app-bar-nav-icon
        class="grey--text text--darken-2"
        @click="miniVariant = !miniVariant"
      ></v-app-bar-nav-icon>
      <v-toolbar-title class="grey--text text--darken-2">{{
        page_title
      }}</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn text color="grey">
        Sign Out
        <v-icon>mdi-chart-bubble</v-icon>
        <v-icon>exit-run</v-icon>
      </v-btn>
    </v-app-bar>
    <nuxt />
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      drawer: true,
      miniVariant: true,
      right: true,
      rightDrawer: false,
      title: "Vuetify.js",
      page_title: "Dashboard",
      items: [
        {
          icon: "mdi-apps",
          title: "App",
          to: "/"
        },
        {
          icon: "mdi-chart-bubble",
          title: "Category",
          to: "/inspire"
        },
        {
          icon: "mdi-chart-bubble",
          title: "Movie",
          to: "/inspire"
        },
        {
          icon: "mdi-chart-bubble",
          title: "Test",
          to: "/inspire"
        },
        {
          icon: "mdi-chart-bubble",
          title: "User",
          to: "/inspire"
        }
      ]
    };
  }
};
</script>
