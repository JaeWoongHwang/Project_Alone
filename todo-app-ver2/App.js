import React from 'react';
import { StyleSheet, Text, View, StatusBar, Dimensions, Platform, TextInput, ScrollView } from 'react-native';
import {AppLoading} from "expo";
import ToDo from "./ToDo";
import uuidv1 from "uuid/v1";

const {height, width} = Dimensions.get("window");

export default class App extends React.Component {
  state = {
    newToDo: "",
    loadedToDos: false
  };
  componentDidMount = () => {
    this._loadToDos();
  };
  render() {
    const {newToDo, loadedToDos} = this.state;
    if(!loadedToDos){
      return <AppLoading/>;
    }
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
          returnKeyType={"done"}
          autoCorrect={false}
          onSubmitEdting={this._addToDo}
          />
          <ScrollView contentContainerStyle={styles.toDos}>
            <ToDo text={"Hello, I am a to do"}/>
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
  _loadToDos = () => {
    this.setState({
      loadedToDos: true
    });
  };
  _addToDo = () => {
      const {newToDo} = this.state;
      if(newToDo !== ""){
        this.setState(prevState=> {
          const ID = uuidv1();
          const newToDoObject ={
            [ID]: {
              id: ID,
              isCompleted: false,
              text: newToDo,
              createdAt: Date.now()
            }
          };
          const newState={
            ...prevState,
            newToDo: "",
            toDos: {
              ...prevState.toDos,
              ...newToDoObject
            }
          }
          return {...newState};
        });
      }
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
    fontWeight:"300",
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
  },
  toDos:{
    alignItems: "center"
  }
});
