
class State
{
  boolean canChange = false;
  
  void Enter(){}
  
  void Update(){}
  
  void Exit(){}
}

class StateMachine
{
  State currentState;
  State lastState;
  
  StateMachine(State initState)
  {
    SwitchTo(initState);
  }
  
  public void SwitchTo(State newState)
  {
    if(currentState!=null)
    {
         this.lastState = currentState; 
         lastState.Exit();
    }
    this.currentState = newState;
    currentState.Enter();
  }
  
  public void Update()
  {
    this.currentState.Update();
  }
}
