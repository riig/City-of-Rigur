package customs.basefameCollect {
import com.company.assembleegameclient.account.ui.Frame;
import com.company.assembleegameclient.game.GameSprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import kabam.rotmg.text.view.TextFieldDisplayConcrete;
import kabam.rotmg.text.view.stringBuilder.StaticStringBuilder;

import org.osflash.signals.Signal;

public class CollectFameConfirmation extends Frame{
    public const close:Signal = new Signal();
    private var gs_:GameSprite;
    private var explainText_:TextFieldDisplayConcrete;
    public function CollectFameConfirmation(gameSprite:GameSprite, width:int, height:int) {
        super("Are you sure?", "Agree", "Disagree");
        this.gs_ = gameSprite;
        this.w_ = width;
        this.h_ = height;
        this.leftButton_.x = 20;
        this.rightButton_.x = 200;
        this.addFade();
        this.addText();
        leftButton_.addEventListener(MouseEvent.CLICK, this.onCreate);
        rightButton_.addEventListener(MouseEvent.CLICK, this.onClose);
    }
    private function onCreate(_arg1:MouseEvent): void {
        this.gs_.gsc_.playerText("/collectFame"); //need to add command that functions still
        this.close.dispatch();
    }
    private function onClose(_arg1:MouseEvent): void {
        this.close.dispatch();
    }
    private function addText(): void {
        this.explainText_ = new TextFieldDisplayConcrete().setSize(20).setColor(0xB3B3B3).setTextWidth(30).setBold(true);
        this.explainText_.x = 20;
        this.explainText_.y = 50;
        this.explainText_.setStringBuilder(new StaticStringBuilder("This will add your base fame \ncount to your account fame, \nand reset your XP+Fame to 0. \nThis cannot be undone."));
        this.explainText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.explainText_);
    }
}
}
