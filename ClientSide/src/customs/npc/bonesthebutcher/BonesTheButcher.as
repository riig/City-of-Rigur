package customs.npc.bonesthebutcher {
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.objects.IInteractiveObject;
import com.company.assembleegameclient.ui.panels.Panel;
public class BonesTheButcher extends GameObject implements IInteractiveObject {
    public function BonesTheButcher(_arg1:XML) {
        super(_arg1);
        isInteractive_ = true;
    }
    public function getPanel(_arg1:GameSprite):Panel {
        return (new BonesButcherPanel(_arg1));
    }
}
}