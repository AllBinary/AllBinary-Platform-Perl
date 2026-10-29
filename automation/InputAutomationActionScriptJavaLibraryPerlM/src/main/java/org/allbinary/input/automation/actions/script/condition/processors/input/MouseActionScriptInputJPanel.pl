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
use parent -norequire,'javax::swing::JPanel';


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
    $self->_init_fields();
        $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{START} + $mouseActionScriptInputInterface, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->initComponents();
        $self->{mouseActionScriptInputInterface} = $mouseActionScriptInputInterface;
        my $defaultComboBoxModel = 'org::allbinary::input::automation::actions::script::condition::processors::input::DefaultComboBoxModel'->new();
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
            package java::awt::event::ActionListener::AnonymousN69905 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->okJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69905'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69905'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69905')
        });
        $self->{jLabel2}->setText("Buttons:");
        $self->{jLabel3}->setText("Move To:");
        $self->{button1JCheckBox}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ONE});
        $self->{button1JCheckBox}->setBorder($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{BorderFactory}->createEmptyBorder(0, 0, 0, 0));
        $self->{button1JCheckBox}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{button2JCheckBox}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{TWO});
        $self->{button2JCheckBox}->setBorder($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{BorderFactory}->createEmptyBorder(0, 0, 0, 0));
        $self->{button2JCheckBox}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{button2JCheckBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70522 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->button2JCheckBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70522'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70522'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70522')
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
        $mouseActionJDialogLayout->setHorizontalGroup($mouseActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addContainerGap()->addGroup($mouseActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{inputTypeJLabel})->addGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $mouseActionJDialogLayout->createSequentialGroup()->addGroup($mouseActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $mouseActionJDialogLayout->createSequentialGroup()->addComponent($self->{jLabel2})->addGap(25, 25, 25))->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addGroup($mouseActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{jLabel3})->addComponent($self->{jLabel6}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})))->addGroup($mouseActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{mouseDelayJTextField}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 154, 32767)->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addComponent($self->{titleJLabel})->addGap(45, 45, 45))->addGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $mouseActionJDialogLayout->createSequentialGroup()->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{inputAutomationTypeJComboBox}, 0, 154, 32767))->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addComponent($self->{button1JCheckBox})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{button2JCheckBox}))->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addGroup($mouseActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{TRAILING})->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{okJButton}))->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addComponent($self->{jLabel4})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED}, 5, 32767)->addComponent($self->{mouseXJTextField}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 59, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE})))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jLabel5})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{mouseYJTextField}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 62, 32767)))))->addContainerGap()));
        $mouseActionJDialogLayout->setVerticalGroup($mouseActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($mouseActionJDialogLayout->createSequentialGroup()->addComponent($self->{titleJLabel})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($mouseActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{inputTypeJLabel})->addComponent($self->{inputAutomationTypeJComboBox}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($mouseActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{jLabel2}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 15, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addGroup($mouseActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{button1JCheckBox})->addComponent($self->{button2JCheckBox})))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($mouseActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel6})->addComponent($self->{mouseDelayJTextField}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($mouseActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel3})->addComponent($self->{jLabel4})->addComponent($self->{jLabel5})->addComponent($self->{mouseYJTextField}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{mouseXJTextField}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addComponent($self->{okJButton})->addContainerGap()));
        $self->setMinimumSize('java::awt::Dimension'->new(100, 0));
        $self->{mouseActionJButton}->setText("Edit");
        $self->{mouseActionJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN74399 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->mouseActionJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN74399'->can('new') ? 'java::awt::event::ActionListener::AnonymousN74399'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN74399')
        });
        $self->{jLabel1}->setText("Mouse:");
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jLabel1})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED}, 36, 32767)->addComponent($self->{mouseActionJButton})));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel1})->addComponent($self->{mouseActionJButton})));
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

# use java::awt::event::InputEvent;
# use javax::swing;
use org::allbinary::input::automation::robot::InputRobot;
use org::allbinary::input::automation::robot::InputRobotFactory;
use org::allbinary::input::automation::robot::TempInputRobotNames;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonStrings;
use org::allbinary::input::automation::actions::script::condition::processors::input::DefaultComboBoxModel;

1;

