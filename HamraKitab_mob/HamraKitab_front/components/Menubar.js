import React from 'react';
import { View, TouchableOpacity, StyleSheet } from 'react-native';
import { Folders, Search, PlusCircle, Zap, User } from "lucide-react-native";

const MenuBar = ({ navigation }) => {
  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.button} onPress={() => navigation.navigate('BookRecommendation')}>
        <Folders width={24} height={24} color="#94a3b8" />
      </TouchableOpacity>
      <TouchableOpacity style={styles.button} onPress={() => {/* Navigate to Search Screen */}}>
        <Search width={24} height={24} color="#94a3b8" />
      </TouchableOpacity>
      <TouchableOpacity style={styles.addButton} onPress={() => {/* Action for Add Button */}}>
        <PlusCircle width={32} height={32} color="#34d399" />
      </TouchableOpacity>
      <TouchableOpacity style={styles.button} onPress={() => {/* Navigate to Zap Screen */}}>
        <Zap width={24} height={24} color="#94a3b8" />
      </TouchableOpacity>
      <TouchableOpacity style={styles.button} onPress={() => {/* Navigate to User Screen */}}>
        <User width={24} height={24} color="#94a3b8" />
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    alignItems: 'center',
    height: 64,
    backgroundColor: 'rgba(30, 41, 59, 0.8)',
    borderTopWidth: 1,
    borderTopColor: '#334155',
  },
  button: {
    padding: 8,
  },
  addButton: {
    padding: 8,
    borderRadius: 20,
    borderWidth: 2,
    borderColor: '#34d399',
  },
});

export default MenuBar;
