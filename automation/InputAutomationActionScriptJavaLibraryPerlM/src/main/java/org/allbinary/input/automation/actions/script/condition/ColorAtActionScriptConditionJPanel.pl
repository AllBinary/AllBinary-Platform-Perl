#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{colorAtActionScriptConditionInterface} = undef;
    $self->{blueJLabel} = undef;
    $self->{colorAtActionJButton} = undef;
    $self->{colorAtActionJDialog} = undef;
    $self->{colorAtXJTextField} = undef;
    $self->{colorAtYJTextField} = undef;
    $self->{colorRangeJLabel} = undef;
    $self->{greenJLabel} = undef;
    $self->{jLabel1} = undef;
    $self->{locationJLabel} = undef;
    $self->{maxBlueJTextField} = undef;
    $self->{maxGreenJTextField} = undef;
    $self->{maxJLabel} = undef;
    $self->{maxRedJTextField} = undef;
    $self->{minBlueJTextField} = undef;
    $self->{minGreenJTextField} = undef;
    $self->{minJLabel} = undef;
    $self->{minRedJTextField} = undef;
    $self->{okJButton} = undef;
    $self->{redJLabel} = undef;
    $self->{titleJLabel} = undef;
    $self->{xJLabel} = undef;
    $self->{yJLabel} = undef;
}


sub new {
    my ($class, $colorAtActionScriptConditionInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->initComponents();
        $self->{colorAtActionScriptConditionInterface} = $colorAtActionScriptConditionInterface;
        $self->set();
    return $self;
}


sub set {
    my ($self) = @_;
        my $colorRangeInterface = $self->{colorAtActionScriptConditionInterface}->getColorRangeInterface();
        $self->getMinRedJTextField()->setText(("" . ($colorRangeInterface->getMinRed())));
        $self->getMaxRedJTextField()->setText(("" . ($colorRangeInterface->getMaxRed())));
        $self->getMinGreenJTextField()->setText(("" . ($colorRangeInterface->getMinGreen())));
        $self->getMaxGreenJTextField()->setText(("" . ($colorRangeInterface->getMaxGreen())));
        $self->getMinBlueJTextField()->setText(("" . ($colorRangeInterface->getMinBlue())));
        $self->getMaxBlueJTextField()->setText(("" . ($colorRangeInterface->getMaxBlue())));
        $self->getColorAtXJTextField()->setText(("" . ($self->{colorAtActionScriptConditionInterface}->getPoint()->{x})));
        $self->getColorAtYJTextField()->setText(("" . ($self->{colorAtActionScriptConditionInterface}->getPoint()->{y})));
        $self->{colorAtActionScriptConditionInterface}->log();
}


sub update {
    my ($self) = @_;
        my $colorRangeInterface = $self->{colorAtActionScriptConditionInterface}->getColorRangeInterface();
        $colorRangeInterface->setMinRed(int(("" . ($self->getMinRedJTextField()->getText()))));
        $colorRangeInterface->setMaxRed(int(("" . ($self->getMaxRedJTextField()->getText()))));
        $colorRangeInterface->setMinGreen(int(("" . ($self->getMinGreenJTextField()->getText()))));
        $colorRangeInterface->setMaxGreen(int(("" . ($self->getMaxGreenJTextField()->getText()))));
        $colorRangeInterface->setMinBlue(int(("" . ($self->getMinBlueJTextField()->getText()))));
        $colorRangeInterface->setMaxBlue(int(("" . ($self->getMaxBlueJTextField()->getText()))));
        my $xString = $self->getColorAtXJTextField()->getText();
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($xString) && 'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isNumber($xString)) {
            $self->{colorAtActionScriptConditionInterface}->getPoint()->{x} = int($xString);
        }
        my $yString = $self->getColorAtYJTextField()->getText();
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($yString) && 'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isNumber($yString)) {
            $self->{colorAtActionScriptConditionInterface}->getPoint()->{y} = int($xString);
        }
        $self->{colorAtActionScriptConditionInterface}->log();
}


sub getColorAtXJTextField {
    my ($self) = @_;
        return $self->{colorAtXJTextField};
}


sub setColorAtXJTextField {
    my ($self, $colorAtXJTextField) = @_;
        $self->{colorAtXJTextField} = $colorAtXJTextField;
}


sub getColorAtYJTextField {
    my ($self) = @_;
        return $self->{colorAtYJTextField};
}


sub setColorAtYJTextField {
    my ($self, $colorAtYJTextField) = @_;
        $self->{colorAtYJTextField} = $colorAtYJTextField;
}


sub getMaxBlueJTextField {
    my ($self) = @_;
        return $self->{maxBlueJTextField};
}


sub setMaxBlueJTextField {
    my ($self, $maxBlueJTextField) = @_;
        $self->{maxBlueJTextField} = $maxBlueJTextField;
}


sub getMaxGreenJTextField {
    my ($self) = @_;
        return $self->{maxGreenJTextField};
}


sub setMaxGreenJTextField {
    my ($self, $maxGreenJTextField) = @_;
        $self->{maxGreenJTextField} = $maxGreenJTextField;
}


sub getMaxRedJTextField {
    my ($self) = @_;
        return $self->{maxRedJTextField};
}


sub setMaxRedJTextField {
    my ($self, $maxRedJTextField) = @_;
        $self->{maxRedJTextField} = $maxRedJTextField;
}


sub getMinBlueJTextField {
    my ($self) = @_;
        return $self->{minBlueJTextField};
}


sub setMinBlueJTextField {
    my ($self, $minBlueJTextField) = @_;
        $self->{minBlueJTextField} = $minBlueJTextField;
}


sub getMinGreenJTextField {
    my ($self) = @_;
        return $self->{minGreenJTextField};
}


sub setMinGreenJTextField {
    my ($self, $minGreenJTextField) = @_;
        $self->{minGreenJTextField} = $minGreenJTextField;
}


sub getMinRedJTextField {
    my ($self) = @_;
        return $self->{minRedJTextField};
}


sub setMinRedJTextField {
    my ($self, $minRedJTextField) = @_;
        $self->{minRedJTextField} = $minRedJTextField;
}


sub getYJLabel {
    my ($self) = @_;
        return $self->{yJLabel};
}


sub setYJLabel {
    my ($self, $yJLabel) = @_;
        $self->{yJLabel} = $yJLabel;
}


sub getColorAtActionJDialog {
    my ($self) = @_;
        return $self->{colorAtActionJDialog};
}


sub setColorAtActionJDialog {
    my ($self, $colorAtActionJDialog) = @_;
        $self->{colorAtActionJDialog} = $colorAtActionJDialog;
}


sub initComponents {
    my ($self) = @_;
        $self->{colorAtActionJDialog} = 'javax::swing::JDialog'->new();
        $self->{titleJLabel} = 'javax::swing::JLabel'->new();
        $self->{locationJLabel} = 'javax::swing::JLabel'->new();
        $self->{colorAtXJTextField} = 'javax::swing::JTextField'->new();
        $self->{xJLabel} = 'javax::swing::JLabel'->new();
        $self->{yJLabel} = 'javax::swing::JLabel'->new();
        $self->{colorAtYJTextField} = 'javax::swing::JTextField'->new();
        $self->{colorRangeJLabel} = 'javax::swing::JLabel'->new();
        $self->{redJLabel} = 'javax::swing::JLabel'->new();
        $self->{minJLabel} = 'javax::swing::JLabel'->new();
        $self->{maxJLabel} = 'javax::swing::JLabel'->new();
        $self->{greenJLabel} = 'javax::swing::JLabel'->new();
        $self->{blueJLabel} = 'javax::swing::JLabel'->new();
        $self->{minRedJTextField} = 'javax::swing::JTextField'->new();
        $self->{maxRedJTextField} = 'javax::swing::JTextField'->new();
        $self->{maxGreenJTextField} = 'javax::swing::JTextField'->new();
        $self->{minBlueJTextField} = 'javax::swing::JTextField'->new();
        $self->{maxBlueJTextField} = 'javax::swing::JTextField'->new();
        $self->{okJButton} = 'javax::swing::JButton'->new();
        $self->{minGreenJTextField} = 'javax::swing::JTextField'->new();
        $self->{colorAtActionJButton} = 'javax::swing::JButton'->new();
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{colorAtActionJDialog}->setMinimumSize('java::awt::Dimension'->new(350, 250));
        $self->{titleJLabel}->setText("              Color At Action Options            ");
        $self->{locationJLabel}->setText("Location:");
        $self->{xJLabel}->setText("X:");
        $self->{yJLabel}->setText("Y:");
        $self->{colorRangeJLabel}->setText("Color Range");
        $self->{redJLabel}->setText("Red:");
        $self->{minJLabel}->setText("Minimum");
        $self->{maxJLabel}->setText("Maximum");
        $self->{greenJLabel}->setText("Green:");
        $self->{blueJLabel}->setText("Blue:");
        $self->{okJButton}->setText("OK");
        $self->{okJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70549 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->okJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70549'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70549'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70549')
        });
        my $colorAtActionJDialogLayout = 'javax::swing::GroupLayout'->new($self->{colorAtActionJDialog}->getContentPane());
        $self->{colorAtActionJDialog}->getContentPane()->setLayout($colorAtActionJDialogLayout);
        $colorAtActionJDialogLayout->setHorizontalGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($colorAtActionJDialogLayout->createSequentialGroup()->addContainerGap()->addGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($colorAtActionJDialogLayout->createSequentialGroup()->addGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{TRAILING})->addComponent($self->{okJButton})->addGroup($colorAtActionJDialogLayout->createSequentialGroup()->addGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING}, 0)->addGroup($colorAtActionJDialogLayout->createSequentialGroup()->addGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{blueJLabel})->addComponent($self->{greenJLabel})->addComponent($self->{redJLabel})->addComponent($self->{colorRangeJLabel}))->addGap(29, 29, 29))->addGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $colorAtActionJDialogLayout->createSequentialGroup()->addComponent($self->{locationJLabel})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addComponent($self->{xJLabel})->addGap(18, 18, 18)))->addGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{minBlueJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 40, 32767)->addComponent($self->{minGreenJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 40, 32767)->addComponent($self->{minJLabel}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addComponent($self->{minRedJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 40, 32767)->addComponent($self->{colorAtXJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 40, 32767))->addGap(16, 16, 16)))->addGap(6, 6, 6)->addComponent($self->{yJLabel})->addGap(24, 24, 24)->addGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{TRAILING})->addComponent($self->{maxJLabel}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING}, $colorAtActionJDialogLayout->createSequentialGroup()->addGap(1, 1, 1)->addGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING}, 0)->addComponent($self->{maxBlueJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{TRAILING})->addComponent($self->{maxRedJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 43, 32767)->addComponent($self->{maxGreenJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 43, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE})))->addComponent($self->{colorAtYJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 44, 32767))->addGap(22, 22, 22))->addGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $colorAtActionJDialogLayout->createSequentialGroup()->addComponent($self->{titleJLabel})->addGap(33, 33, 33)))));
        $colorAtActionJDialogLayout->setVerticalGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($colorAtActionJDialogLayout->createSequentialGroup()->addContainerGap()->addComponent($self->{titleJLabel})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($colorAtActionJDialogLayout->createSequentialGroup()->addGap(15, 15, 15)->addGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{xJLabel})->addComponent($self->{locationJLabel})->addComponent($self->{colorAtXJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{yJLabel}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{minJLabel})->addComponent($self->{colorRangeJLabel}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{minRedJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{redJLabel}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{greenJLabel})->addComponent($self->{minGreenJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($colorAtActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{blueJLabel})->addComponent($self->{minBlueJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED}, 17, 32767)->addComponent($self->{okJButton}))->addGroup($colorAtActionJDialogLayout->createSequentialGroup()->addGap(14, 14, 14)->addComponent($self->{colorAtYJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{maxJLabel})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{maxRedJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{maxGreenJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{maxBlueJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE})))->addContainerGap()));
        $self->setPreferredSize('java::awt::Dimension'->new(100, 0));
        $self->{colorAtActionJButton}->setText("Edit");
        $self->{colorAtActionJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN75550 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->colorAtActionJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN75550'->can('new') ? 'java::awt::event::ActionListener::AnonymousN75550'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN75550')
        });
        $self->{jLabel1}->setText("Color At:");
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jLabel1})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED}, 15, 32767)->addComponent($self->{colorAtActionJButton})));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel1})->addComponent($self->{colorAtActionJButton})));
}


sub okJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->update();
        $self->getColorAtActionJDialog()->setVisible(0);
}


sub colorAtActionJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->getColorAtActionJDialog()->setVisible(1);
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::media::image::analysis::ColorRangeInterface;
use org::allbinary::string::CommonStrings;

1;

