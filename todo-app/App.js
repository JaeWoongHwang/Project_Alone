import React from 'react';
import { StyleSheet, Text, View, StatusBar, Dimensions, Platform, TextInput, ScrollView } from 'react-native';
import ToDo from "./ToDo";

const {height, width} = Dimensions.get("window");

export default class App extends React.Component {
  state = {
    newToDo: ""
  };
  render() {
    const {newToDo} = this.state;
    return (
      <View style={styles.container}>
        <StatusBar barstyle="light-content"/>
        <Text style={styles.title}>Daily To-Do App</Text>
        <View style={styles.card}>
          <TextInput
          style={styles.input}
          placeholder={"New To Do"}
          placeholderTextColor= {"#999"}
          value={newToDo}
          onChangeText={this._controlNewToDo}
          returnKeyType={"Done"}
          autoCorrect={false}
          />
          <ScrollView>
            <ToDo/>
          </ScrollView>
        </View>
      </View>
    );
  }
  _controlNewToDo = text => {
    this.setState({
      newToDo: text
    });
  };
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#5EC0E5',
    alignItems: 'center'
  },
  title: {
    color: "white",
    fontSize: 30,
    fontWeight:"200",
    marginTop: 50,
    marginBottom: 30
  },
  card: {
    backgroundColor: "white",
    flex: 1,
    width: width -25,
    borderTopLeftRadius: 10,
    borderTopRightRadius: 10,
    ...Platform.select({
        ios:{
          shadowColor: "rgb(50, 50, 50)",
          shadowOpacity: 0.5,
          shadowRadius: 5,
          shadowOffset:{
            height: -1,
            width: 0
          }
        },
        android:{
          elevation: 3
        }
    })
  },
  input: {
    padding: 20,
    borderBottomColor: "#bbb",
    borderBottomWidth: 1,
    fontSize: 25
  }
});
