import React from "react";
import { createStackNavigator } from "@react-navigation/stack";
import { NavigationContainer, DefaultTheme } from "@react-navigation/native";
import { useFonts } from "expo-font";

import Login from "./screens/Login";
import AdminDashboard from './screens/Admin/AdminDashboard'; // Adjust the path as needed
import CreateEditBook from './screens/Admin/CreateEditBook';
import BookRecommendation from './screens/User/BookRecommendation'; // Adjust the path as needed
import BookReview from './screens/User/BookReview';
import Register from "./screens/Register";
import SearchScreen from "./screens/User/SearchScreen";
import FriendRequestScreen from './screens/User/FriendRequestScreen'; // Adjust the path as needed
import FriendsActivityScreen from './screens/User/FriendsActivityScreen'; // Adjust the path as needed
import YourActivityScreen from "./screens/User/YourActivityScreen";
import ProfileScreen from "./screens/User/ProfileScreen";
import ListsScreen from "./screens/User/ListsScreen";
import WatchlistScreen from "./screens/User/WatchlistScreen";
import DiaryScreen from "./screens/User/DiaryScreen";





const theme = {
  ...DefaultTheme,
  colors: {
    ...DefaultTheme.colors,
    background: "transparent",
  },
};

const Stack = createStackNavigator();

const App = () => {
  const [loaded] = useFonts({
    InterBold: require("./assets/fonts/Inter-Bold.ttf"),
    InterSemiBold: require("./assets/fonts/Inter-SemiBold.ttf"),
    InterMedium: require("./assets/fonts/Inter-Medium.ttf"),
    InterRegular: require("./assets/fonts/Inter-Regular.ttf"),
    InterLight: require("./assets/fonts/Inter-Light.ttf"),
  });

  if (!loaded) return null;

  return (
    <NavigationContainer theme={theme}>
      <Stack.Navigator
        screenOptions={{
          headerShown: false,
        }}
        initialRouteName="Register"
      >
        <Stack.Screen name="Login" component={Login} />
        
        <Stack.Screen name="Register" component={Register} />

        <Stack.Screen name="AdminDashboard" component={AdminDashboard} />
        <Stack.Screen name="CreateEditBook" component={CreateEditBook} />
        <Stack.Screen name="BookRecommendation" component={BookRecommendation} />
        <Stack.Screen name="BookReview" component={BookReview} />
        <Stack.Screen name="SearchScreen" component={SearchScreen} />
        <Stack.Screen name="FriendsActivityScreen" component={FriendsActivityScreen} />
        <Stack.Screen name="FriendRequestScreen" component={FriendRequestScreen} />
        <Stack.Screen name="YourActivityScreen" component={YourActivityScreen} />
        <Stack.Screen name="DiaryScreen" component={DiaryScreen} />
        <Stack.Screen name="WatchlistScreen" component={WatchlistScreen} />
        <Stack.Screen name="ListsScreen" component={ListsScreen} />
        <Stack.Screen name="ProfileScreen" component={ProfileScreen} />






      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;