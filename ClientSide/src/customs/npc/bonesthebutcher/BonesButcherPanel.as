package customs.npc.bonesthebutcher {

import customs.basefameCollect.CollectFameConfirmation;
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.panels.ButtonPanel;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;

import kabam.rotmg.ui.model.HUDModel;

public class BonesButcherPanel extends ButtonPanel {
    public function BonesButcherPanel(_arg1:GameSprite) {
        super(_arg1, "Bones the Butcher", "Talk");
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    override protected function onButtonClick(_arg1:MouseEvent):void {
        this.gs_.addChild(new CollectFameConfirmation(Gs_, 330, 250));
    }

    private function onAddedToStage(_arg1:Event):void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
    }

    private function onKeyDown(_arg1:KeyboardEvent):void {
        if ((((_arg1.keyCode == Parameters.data_.interact)) && ((stage.focus == null)))) {
            this.openPanel();
        }
    }
    private function openPanel():void {
        this.gs_.addChild(new CollectFameConfirmation(Gs_, 330, 250));
    }


}
}