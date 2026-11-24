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

package org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{mouseActionScriptInputInterface} = undef;
    $self->{button1JCheckBox} = undef;
    $self->{button2JCheckBox} = undef;
    $self->{inputAutomationTypeJComboBox} = undef;
    $self->{inputTypeJLabel} = undef;
    $self->{jLabel1} = undef;
    $self->{jLabel2} = undef;
    $self->{jLabel3} = undef;
    $self->{jLabel4} = undef;
    $self->{jLabel5} = undef;
    $self->{jLabel6} = undef;
    $self->{mouseActionJButton} = undef;
    $self->{mouseActionJDialog} = undef;
    $self->{mouseDelayJTextField} = undef;
    $self->{mouseXJTextField} = undef;
    $self->{mouseYJTextField} = undef;
    $self->{okJButton} = undef;
    $self->{titleJLabel} = undef;
}


sub new {
    my ($class, $mouseActionScriptInputInterface) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{START} + $mouseActionScriptInputInterface, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->initComponents();
        $self->{mouseActionScriptInputInterface} = $mouseActionScriptInputInterface;
        my $defaultComboBoxModel = 'javax::swing::DefaultComboBoxModel'->new();
        $defaultComboBoxModel->addElement($org::allbinary::input::automation::robot::TempInputRobotNames::LOW_NAME);
        $defaultComboBoxModel->addElement($org::allbinary::input::automation::robot::TempInputRobotNames::SYS_NAME);
        $defaultComboBoxModel->addElement($org::allbinary::input::automation::robot::InputRobot::NAME);
        $self->{inputAutomationTypeJComboBox}->setModel($defaultComboBoxModel);
        $self->set();
    return $self;
}


sub set {
    my ($self) = @_;
        my $inputTypeComboBoxModel = $self->{inputAutomationTypeJComboBox}->getModel();
        $inputTypeComboBoxModel->setSelectedItem($self->{mouseActionScriptInputInterface}->getInputRobotInterface()->getName());
        if (($self->{mouseActionScriptInputInterface}->getButtonClicks() & $java::awt::event::InputEvent::BUTTON1_MASK) != 0) {
            $self->{button1JCheckBox}->setSelected(1);
        } else {
            $self->{button1JCheckBox}->setSelected(0);
        }
        if (($self->{mouseActionScriptInputInterface}->getButtonClicks() & $java::awt::event::InputEvent::BUTTON2_MASK) != 0) {
            $self->{button2JCheckBox}->setSelected(1);
        } else {
            $self->{button2JCheckBox}->setSelected(0);
        }
        $self->{mouseDelayJTextField}->setText(("" . ($self->{mouseActionScriptInputInterface}->getTime())));
        $self->{mouseXJTextField}->setText(("" . ($self->{mouseActionScriptInputInterface}->getPoint()->{x})));
        $self->{mouseYJTextField}->setText(("" . ($self->{mouseActionScriptInputInterface}->getPoint()->{y})));
        $self->{mouseActionScriptInputInterface}->log();
}


# throws Exception
sub updateInputType {
    my ($self) = @_;
        my $comboBoxModel = $self->{inputAutomationTypeJComboBox}->getModel();
        my $selectedItem = $comboBoxModel->getSelectedItem();
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($selectedItem)) {
            $self->{mouseActionScriptInputInterface}->setInputRobotInterface('org::allbinary::input::automation::robot::InputRobotFactory'->getInstance()->get($selectedItem));
        }
}


# throws Exception
sub update {
    my ($self) = @_;
        $self->updateInputType();
        $self->{mouseActionScriptInputInterface}->setTime(("" . ($self->{mouseDelayJTextField}->getText())));
        $self->{logUtil}->putF("Button State: " . $self->{mouseActionScriptInputInterface}->getButtonClicks(), $self, "update");
        if ($self->{button1JCheckBox}->isSelected()) {
            if (($self->{mouseActionScriptInputInterface}->getButtonClicks() & $java::awt::event::InputEvent::BUTTON1_MASK) == 0) {
                $self->{mouseActionScriptInputInterface}->setButtonClicks($self->{mouseActionScriptInputInterface}->getButtonClicks() | $java::awt::event::InputEvent::BUTTON1_MASK);
                $self->{logUtil}->putF("Button 1 Selected: " . $self->{mouseActionScriptInputInterface}->getButtonClicks(), $self, "update");
            }
        } else {
            if (($self->{mouseActionScriptInputInterface}->getButtonClicks() & $java::awt::event::InputEvent::BUTTON1_MASK) != 0) {
                $self->{mouseActionScriptInputInterface}->setButtonClicks($self->{mouseActionScriptInputInterface}->getButtonClicks() ^ $java::awt::event::InputEvent::BUTTON1_MASK);
                $self->{logUtil}->putF("Button 1 Deselected: " . $self->{mouseActionScriptInputInterface}->getButtonClicks(), $self, "update");
            }
        }
        if ($self->{button2JCheckBox}->isSelected()) {
            if (($self->{mouseActionScriptInputInterface}->getButtonClicks() & $java::awt::event::InputEvent::BUTTON2_MASK) == 0) {
                $self->{mouseActionScriptInputInterface}->setButtonClicks($self->{mouseActionScriptInputInterface}->getButtonClicks() | $java::awt::event::InputEvent::BUTTON2_MASK);
                $self->{logUtil}->putF("Button 2 Selected: " . $self->{mouseActionScriptInputInterface}->getButtonClicks(), $self, "update");
            }
        } else {
            if (($self->{mouseActionScriptInputInterface}->getButtonClicks() & $java::awt::event::InputEvent::BUTTON2_MASK) != 0) {
                $self->{mouseActionScriptInputInterface}->setButtonClicks($self->{mouseActionScriptInputInterface}->getButtonClicks() ^ $java::awt::event::InputEvent::BUTTON2_MASK);
                $self->{logUtil}->putF("Button 2 Deselected: " . $self->{mouseActionScriptInputInterface}->getButtonClicks(), $self, "update");
            }
        }
        my $mouseXString = $self->{mouseXJTextField}->getText();
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($mouseXString) && 'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isNumber($mouseXString)) {
            $self->{mouseActionScriptInputInterface}->getPoint()->{x} = int($mouseXString);
        }
        my $mouseYString = $self->{mouseYJTextField}->getText();
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($mouseYString) && 'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isNumber($mouseYString)) {
            $self->{mouseActionScriptInputInterface}->getPoint()->{y} = int($mouseYString);
        }
        $self->{mouseActionScriptInputInterface}->log();
}


sub getMouseActionJDialog {
    my ($self) = @_;
        return $self->{mouseActionJDialog};
}


sub setMouseActionJDialog {
    my ($self, $mouseActionJDialog) = @_;
        $self->{mouseActionJDialog} = $mouseActionJDialog;
}


sub initComponents {
    my ($self) = @_;
        $self->{mouseActionJDialog} = 'javax::swing::JDialog'->new();
        $self->{titleJLabel} = 'javax::swing::JLabel'->new();
        $self->{okJButton} = 'javax::swing::JButton'->new();
        $self->{jLabel2} = 'javax::swing::JLabel'->new();
        $self->{jLabel3} = 'javax::swing::JLabel'->new();
        $self->{button1JCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{button2JCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{jLabel4} = 'javax::swing::JLabel'->new();
        $self->{mouseXJTextField} = 'javax::swing::JTextField'->new();
        $self->{jLabel5} = 'javax::swing::JLabel'->new();
        $self->{mouseYJTextField} = 'javax::swing::JTextField'->new();
        $self->{inputTypeJLabel} = 'javax::swing::JLabel'->new();
        $self->{inputAutomationTypeJComboBox} = 'javax::swing::JComboBox'->new();
        $self->{jLabel6} = 'javax::swing::JLabel'->new();
        $self->{mouseDelayJTextField} = 'javax::swing::JTextField'->new();
        $self->{mouseActionJButton} = 'javax::swing::JButton'->new();
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{mouseActionJDialog}->setMinimumSize('java::awt::Dimension'->new(275, 185));
        $self->{titleJLabel}->setText("Mouse Input Options");
        $self->{okJButton}->setText("OK");
        $self->{okJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69875 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->okJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69875'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69875'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69875')
        });
        $self->{jLabel2}->setText("Buttons:");
        $self->{jLabel3}->setText("Move To:");
        $self->{button1JCheckBox}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ONE});
        $self->{button1JCheckBox}->setBorder('javax::swing::BorderFactory'->createEmptyBorder(0, 0, 0, 0));
        $self->{button1JCheckBox}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{button2JCheckBox}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{TWO});
        $self->{button2JCheckBox}->setBorder('javax::swing::BorderFactory'->createEmptyBorder(0, 0, 0, 0));
        $self->{button2JCheckBox}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{button2JCheckBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70380 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->button2JCheckBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70380'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70380'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70380')
        });
        $self->{jLabel4}->setText("x:");
        $self->{mouseXJTextField}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        $self->{jLabel5}->setText("y:");
        $self->{mouseYJTextField}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        $self->{inputTypeJLabel}->setText("Input Type:");
        $self->{jLabel6}->setText("Delay:");
        $self->{mouseDelayJTextField}->setText("100");
        my $mouseActionJDialogLayout = 'javax::swing::GroupLayout'->new($self->{mouseActionJDialog}->getContentPane());
        $self->{mouseActionJDialog}->getContentPane()->setLayout($mouseActionJDialogLayout);
        $mouseActionJDialogLayout->setHorizontalGroup($mouseActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addContainerGap()->addGroup($mouseActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{inputTypeJLabel})->addGroup($javax::swing::GroupLayout::Alignment->{TRAILING}, $mouseActionJDialogLayout->createSequentialGroup()->addGroup($mouseActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($javax::swing::GroupLayout::Alignment->{TRAILING}, $mouseActionJDialogLayout->createSequentialGroup()->addComponent($self->{jLabel2})->addGap(25, 25, 25))->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addGroup($mouseActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{jLabel3})->addComponent($self->{jLabel6}))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})))->addGroup($mouseActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{mouseDelayJTextField}, $javax::swing::GroupLayout::Alignment->{TRAILING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 154, 32767)->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addComponent($self->{titleJLabel})->addGap(45, 45, 45))->addGroup($javax::swing::GroupLayout::Alignment->{TRAILING}, $mouseActionJDialogLayout->createSequentialGroup()->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{inputAutomationTypeJComboBox}, 0, 154, 32767))->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addComponent($self->{button1JCheckBox})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{button2JCheckBox}))->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addGroup($mouseActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{TRAILING})->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{okJButton}))->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addComponent($self->{jLabel4})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED}, 5, 32767)->addComponent($self->{mouseXJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, 59, $javax::swing::GroupLayout::PREFERRED_SIZE)))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{jLabel5})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{mouseYJTextField}, $javax::swing::GroupLayout::DEFAULT_SIZE, 62, 32767)))))->addContainerGap()));
        $mouseActionJDialogLayout->setVerticalGroup($mouseActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addComponent($self->{titleJLabel})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($mouseActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{inputTypeJLabel})->addComponent($self->{inputAutomationTypeJComboBox}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($mouseActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{jLabel2}, $javax::swing::GroupLayout::PREFERRED_SIZE, 15, $javax::swing::GroupLayout::PREFERRED_SIZE)->addGroup($mouseActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{button1JCheckBox})->addComponent($self->{button2JCheckBox})))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($mouseActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{jLabel6})->addComponent($self->{mouseDelayJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($mouseActionJDialogLayout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{jLabel3})->addComponent($self->{jLabel4})->addComponent($self->{jLabel5})->addComponent($self->{mouseYJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{mouseXJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED}, $javax::swing::GroupLayout::DEFAULT_SIZE, 32767)->addComponent($self->{okJButton})->addContainerGap()));
        $self->setMinimumSize('java::awt::Dimension'->new(100, 0));
        $self->{mouseActionJButton}->setText("Edit");
        $self->{mouseActionJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN73409 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->mouseActionJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN73409'->can('new') ? 'java::awt::event::ActionListener::AnonymousN73409'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN73409')
        });
        $self->{jLabel1}->setText("Mouse:");
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jLabel1})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED}, 36, 32767)->addComponent($self->{mouseActionJButton})));
        $layout->setVerticalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{jLabel1})->addComponent($self->{mouseActionJButton})));
}


sub button2JCheckBoxActionPerformed {
    my ($self, $evt) = @_;
}


sub okJButtonActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->update();
            $self->getMouseActionJDialog()->setVisible(0);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "okButtonActionPerformed", $e);
        }
}


sub mouseActionJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->getMouseActionJDialog()->setVisible(1);
}

use java::lang::Object ();
# use java::awt::event::InputEvent ();
# use javax::swing::DefaultComboBoxModel ();
# use javax::swing::ComboBoxModel ();
use org::allbinary::input::automation::robot::InputRobot ();
use org::allbinary::input::automation::robot::InputRobotFactory ();
use org::allbinary::input::automation::robot::TempInputRobotNames ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::string::StringValidationUtil ();
use org::allbinary::string::CommonLabels ();
use org::allbinary::string::CommonPhoneStrings ();
use org::allbinary::string::CommonStrings ();
# use java::awt::Dimension ();
# use java::awt::Insets ();
# use java::awt::event::ActionEvent ();
# use java::awt::event::ActionListener ();
# use javax::swing::BorderFactory ();
# use javax::swing::GroupLayout ();
# use javax::swing::JButton ();
# use javax::swing::JCheckBox ();
# use javax::swing::JComboBox ();
# use javax::swing::JDialog ();
# use javax::swing::JLabel ();
# use javax::swing::JPanel ();
# use javax::swing::JTextField ();
# use javax::swing::LayoutStyle ();

1;

