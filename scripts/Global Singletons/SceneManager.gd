extends Node2D

func gotoScene(sceneToGo: PackedScene, mainScenePath:String = "/root/MainContainer"):

    var mainContainer = get_node(mainScenePath)
    var previousScene
    if mainContainer.get_child_count() > 2:
        previousScene = mainContainer.get_child(mainContainer.get_child_count()-1)
        previousScene.call_deferred('free')
    var sceneToGoInstance = sceneToGo.instance()
    mainContainer.add_child(sceneToGoInstance)