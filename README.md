# Swift Protocol Delegate Pattern :metal:
Sample code  about Protocol Delegate Pattern

## What is a Protocol?

**Protocols** defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements.

## What is a Delegate?

**Delegates** are a design pattern that allows one object to send messages to another object when a specific event happens


### Protocol and Delegate in this Example

#### Protocol

```swift


protocol SettingsViewControllerDelegate{
    func didChange(_ profile:Profile)
}

```
#### Create SettingsViewControllerDelegate variable

```swift

var settingsViewControllerDelegate:SettingsViewControllerDelegate?

```

#### Call Delegate ( when Save Bar Button Item Tapped )

```swift
  settingsViewControllerDelegate?.didChange(profile)
```

#### Assigning the delegate to Settings ViewController

```swift
controller.settingsViewControllerDelegate = self
```
#### Implementing the Protocol methods

```swift

extension ProfileViewController:SettingsViewControllerDelegate{
    func didChange(_ profile: Profile) {
        self.apply(profile)
    }
}

```

