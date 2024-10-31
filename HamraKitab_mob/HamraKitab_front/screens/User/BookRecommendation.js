import React from 'react';
import { View, StyleSheet } from 'react-native';
import Heading from '../../components/Heading'; // Adjust the import path as necessary
import BookNavbar from '../../components/BookNavbar';
import MenuBar from '../../components/Menubar'; // Adjust the import path as necessary

const BookRecommendation = () => {
  return (
    <View style={styles.container}>
      <Heading />
      <BookNavbar />
      {/* Add your book recommendation content here */}
      <View style={styles.content}>
        {/* Content for book recommendations */}
      </View>
      <MenuBar />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f8fafc',
  },
  content: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default BookRecommendation;
