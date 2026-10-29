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

package org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{keyActionScriptInputInterface} = undef;
    $self->{addKeyJLabel} = undef;
    $self->{delayBetweenJLabel} = undef;
    $self->{delayJTextField} = undef;
    $self->{holdTimeJLabel} = undef;
    $self->{inputAutomationTypeJComboBox} = undef;
    $self->{inputTypeJLabel} = undef;
    $self->{jLabel1} = undef;
    $self->{jPanel1} = undef;
    $self->{keyActionJButton} = undef;
    $self->{keyActionJDialog} = undef;
    $self->{keyIntegerJComboBox} = undef;
    $self->{keyNameJComboBox} = undef;
    $self->{normalJRadioButton} = undef;
    $self->{okJButton} = undef;
    $self->{pressJRadioButton} = undef;
    $self->{releaseJRadioButton} = undef;
    $self->{sequenceJRadioButton} = undef;
    $self->{simultaneousJRadioButton} = undef;
    $self->{testJLabel} = undef;
    $self->{textJTextField} = undef;
    $self->{timeJTextField} = undef;
    $self->{titleJLabel} = undef;
}


sub new {
    my ($class, $keyActionScriptInputInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->initComponents();
        $self->{keyActionScriptInputInterface} = $keyActionScriptInputInterface;
        my $defaultComboBoxModel = 'org::allbinary::input::automation::actions::script::condition::processors::input::DefaultComboBoxModel'->new();
        $defaultComboBoxModel->addElement($org::allbinary::input::automation::robot::TempInputRobotNames::DX_NAME);
        $defaultComboBoxModel->addElement($org::allbinary::input::automation::robot::InputRobot::NAME);
        $self->{inputAutomationTypeJComboBox}->setModel($defaultComboBoxModel);
        $self->{keyNameJComboBox}->setModel('org::allbinary::input::automation::actions::script::condition::processors::input::KeyNameDefaultComboBoxModelFactory'->getInstance());
        $self->{keyIntegerJComboBox}->setModel('org::allbinary::input::automation::actions::script::condition::processors::input::KeyCharDefaultComboBoxModelFactory'->getInstance());
        if ($self->{keyActionScriptInputInterface}->isNormal()) {
            $self->{normalJRadioButton}->setSelected(1);
            $self->{pressJRadioButton}->setSelected(0);
            $self->{releaseJRadioButton}->setSelected(0);
        } elsif ($self->{keyActionScriptInputInterface}->isPress()) {
            $self->{normalJRadioButton}->setSelected(0);
            $self->{pressJRadioButton}->setSelected(1);
            $self->{releaseJRadioButton}->setSelected(0);
        } elsif ($self->{keyActionScriptInputInterface}->isRelease()) {
            $self->{normalJRadioButton}->setSelected(0);
            $self->{pressJRadioButton}->setSelected(0);
            $self->{releaseJRadioButton}->setSelected(1);
        }
        $self->set();
    return $self;
}


sub set {
    my ($self) = @_;
        my $inputTypeComboBoxModel = $self->{inputAutomationTypeJComboBox}->getModel();
        $inputTypeComboBoxModel->setSelectedItem($self->{keyActionScriptInputInterface}->getInputRobotInterface()->getName());
        $self->{textJTextField}->setText($self->{keyActionScriptInputInterface}->getText());
        $self->{delayJTextField}->setText(("" . ($self->{keyActionScriptInputInterface}->getDelayBetweenKeys())));
        $self->{timeJTextField}->setText(("" . ($self->{keyActionScriptInputInterface}->getTime())));
        $self->{keyActionScriptInputInterface}->log();
}


# throws Exception
sub updateInputType {
    my ($self) = @_;
        my $comboBoxModel = $self->{inputAutomationTypeJComboBox}->getModel();
        my $selectedItem = $comboBoxModel->getSelectedItem();
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($selectedItem)) {
            $self->{keyActionScriptInputInterface}->setInputRobotInterface('org::allbinary::input::automation::robot::InputRobotFactory'->getInstance()->get($selectedItem));
        }
}


sub getSelectedKey {
    my ($self) = @_;
        my $comboBoxModel = $self->{keyNameJComboBox}->getModel();
        my $selectedItem = $comboBoxModel->getSelectedItem();
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($selectedItem)) {
            return 'org::allbinary::input::KeySingletonFactory'->getHashtable()->get($selectedItem);
        }
        return undef;
}


sub updateKeys {
    my ($self) = @_;
        my $text = $self->{textJTextField}->getText();
        $self->{keyActionScriptInputInterface}->setText($text);
}


# throws Exception
sub update {
    my ($self) = @_;
        $self->updateInputType();
        $self->updateKeys();
        $self->{keyActionScriptInputInterface}->setTime(int(("" . ($self->{timeJTextField}->getText()))));
        $self->{keyActionScriptInputInterface}->log();
}


sub getKeyActionJDialog {
    my ($self) = @_;
        return $self->{keyActionJDialog};
}


sub setKeyActionJDialog {
    my ($self, $keyActionJDialog) = @_;
        $self->{keyActionJDialog} = $keyActionJDialog;
}


sub initComponents {
    my ($self) = @_;
        $self->{keyActionJDialog} = 'javax::swing::JDialog'->new();
        $self->{titleJLabel} = 'javax::swing::JLabel'->new();
        $self->{addKeyJLabel} = 'javax::swing::JLabel'->new();
        $self->{keyNameJComboBox} = 'javax::swing::JComboBox'->new();
        $self->{timeJTextField} = 'javax::swing::JTextField'->new();
        $self->{holdTimeJLabel} = 'javax::swing::JLabel'->new();
        $self->{inputAutomationTypeJComboBox} = 'javax::swing::JComboBox'->new();
        $self->{inputTypeJLabel} = 'javax::swing::JLabel'->new();
        $self->{delayJTextField} = 'javax::swing::JTextField'->new();
        $self->{delayBetweenJLabel} = 'javax::swing::JLabel'->new();
        $self->{testJLabel} = 'javax::swing::JLabel'->new();
        $self->{textJTextField} = 'javax::swing::JTextField'->new();
        $self->{pressJRadioButton} = 'javax::swing::JRadioButton'->new();
        $self->{releaseJRadioButton} = 'javax::swing::JRadioButton'->new();
        $self->{normalJRadioButton} = 'javax::swing::JRadioButton'->new();
        $self->{simultaneousJRadioButton} = 'javax::swing::JRadioButton'->new();
        $self->{sequenceJRadioButton} = 'javax::swing::JRadioButton'->new();
        $self->{jPanel1} = 'javax::swing::JPanel'->new();
        $self->{okJButton} = 'javax::swing::JButton'->new();
        $self->{keyIntegerJComboBox} = 'javax::swing::JComboBox'->new();
        $self->{keyActionJButton} = 'javax::swing::JButton'->new();
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{keyActionJDialog}->setMinimumSize('java::awt::Dimension'->new(255, 280));
        $self->{titleJLabel}->setHorizontalAlignment($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{SwingConstants}->{CENTER});
        $self->{titleJLabel}->setText("Keyboard Input Options");
        $self->{addKeyJLabel}->setText("Add Key:");
        $self->{keyNameJComboBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69302 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->keyNameJComboBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69302'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69302'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69302')
        });
        $self->{timeJTextField}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        $self->{holdTimeJLabel}->setText("Hold Time (ms):");
        $self->{inputTypeJLabel}->setText("Input Type:");
        $self->{delayJTextField}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        $self->{delayBetweenJLabel}->setText("Delay Between Keys (ms):");
        $self->{testJLabel}->setText("Text:");
        $self->{textJTextField}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        $self->{pressJRadioButton}->setText("Press");
        $self->{pressJRadioButton}->setBorder($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{BorderFactory}->createEmptyBorder(0, 0, 0, 0));
        $self->{pressJRadioButton}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{pressJRadioButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69909 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->pressJRadioButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69909'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69909'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69909')
        });
        $self->{releaseJRadioButton}->setText("Release");
        $self->{releaseJRadioButton}->setBorder($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{BorderFactory}->createEmptyBorder(0, 0, 0, 0));
        $self->{releaseJRadioButton}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{releaseJRadioButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70246 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->releaseJRadioButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70246'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70246'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70246')
        });
        $self->{normalJRadioButton}->setSelected(1);
        $self->{normalJRadioButton}->setText("Normal");
        $self->{normalJRadioButton}->setBorder($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{BorderFactory}->createEmptyBorder(0, 0, 0, 0));
        $self->{normalJRadioButton}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{normalJRadioButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70613 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->normalJRadioButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70613'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70613'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70613')
        });
        $self->{simultaneousJRadioButton}->setSelected(1);
        $self->{simultaneousJRadioButton}->setText("Simultaneous");
        $self->{simultaneousJRadioButton}->setBorder($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{BorderFactory}->createEmptyBorder(0, 0, 0, 0));
        $self->{simultaneousJRadioButton}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{simultaneousJRadioButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70980 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->simultaneousJRadioButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70980'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70980'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70980')
        });
        $self->{sequenceJRadioButton}->setText("Sequence");
        $self->{sequenceJRadioButton}->setBorder($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{BorderFactory}->createEmptyBorder(0, 0, 0, 0));
        $self->{sequenceJRadioButton}->setMargin('java::awt::Insets'->new(0, 0, 0, 0));
        $self->{sequenceJRadioButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71317 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->sequenceJRadioButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71317'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71317'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71317')
        });
        $self->{okJButton}->setText("OK");
        $self->{okJButton}->setHorizontalTextPosition($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{SwingConstants}->{CENTER});
        $self->{okJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71562 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->okJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71562'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71562'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71562')
        });
        $self->{jPanel1}->add($self->{okJButton});
        $self->{keyIntegerJComboBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71756 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->keyIntegerJComboBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71756'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71756'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71756')
        });
        my $keyActionJDialogLayout = 'javax::swing::GroupLayout'->new($self->{keyActionJDialog}->getContentPane());
        $self->{keyActionJDialog}->getContentPane()->setLayout($keyActionJDialogLayout);
        $keyActionJDialogLayout->setHorizontalGroup($keyActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($keyActionJDialogLayout->createSequentialGroup()->addContainerGap()->addGroup($keyActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($keyActionJDialogLayout->createSequentialGroup()->addGroup($keyActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING}, 0)->addComponent($self->{addKeyJLabel}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addComponent($self->{inputTypeJLabel}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($keyActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{TRAILING})->addComponent($self->{inputAutomationTypeJComboBox}, 0, 148, 32767)->addComponent($self->{textJTextField}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 148, 32767)->addGroup($keyActionJDialogLayout->createSequentialGroup()->addComponent($self->{keyNameJComboBox}, 0, 101, 32767)->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{keyIntegerJComboBox}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 41, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))))->addComponent($self->{testJLabel}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 60, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addGroup($keyActionJDialogLayout->createSequentialGroup()->addComponent($self->{normalJRadioButton})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{pressJRadioButton})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{releaseJRadioButton})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED}, 48, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $keyActionJDialogLayout->createSequentialGroup()->addComponent($self->{holdTimeJLabel})->addGap(22, 22, 22)->addComponent($self->{timeJTextField}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 113, 32767))->addGroup($keyActionJDialogLayout->createSequentialGroup()->addComponent($self->{delayBetweenJLabel})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED}, 15, 32767)->addComponent($self->{delayJTextField}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, 68, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addGroup($keyActionJDialogLayout->createSequentialGroup()->addComponent($self->{simultaneousJRadioButton})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{sequenceJRadioButton})))->addContainerGap())->addComponent($self->{titleJLabel}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 229, 32767)->addComponent($self->{jPanel1}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 229, 32767));
        $keyActionJDialogLayout->setVerticalGroup($keyActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($keyActionJDialogLayout->createSequentialGroup()->addComponent($self->{titleJLabel})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($keyActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{inputTypeJLabel})->addComponent($self->{inputAutomationTypeJComboBox}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($keyActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{addKeyJLabel})->addComponent($self->{keyIntegerJComboBox}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{keyNameJComboBox}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($keyActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{testJLabel})->addComponent($self->{textJTextField}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($keyActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{pressJRadioButton})->addComponent($self->{normalJRadioButton})->addComponent($self->{releaseJRadioButton}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($keyActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{holdTimeJLabel})->addComponent($self->{timeJTextField}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($keyActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{delayBetweenJLabel})->addComponent($self->{delayJTextField}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($keyActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{simultaneousJRadioButton})->addComponent($self->{sequenceJRadioButton}))->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{jPanel1}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addContainerGap()));
        $self->setMinimumSize('java::awt::Dimension'->new(100, 0));
        $self->{keyActionJButton}->setText("Edit");
        $self->{keyActionJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN76180 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->keyActionJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN76180'->can('new') ? 'java::awt::event::ActionListener::AnonymousN76180'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN76180')
        });
        $self->{jLabel1}->setText("Key:");
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jLabel1})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED}, 49, 32767)->addComponent($self->{keyActionJButton})));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel1})->addComponent($self->{keyActionJButton})));
}


sub prependText {
    my ($self, $integer) = @_;
        if (defined($integer)) {
            my $newKey = "&#" . ("" . ($integer)) . ";";
            $self->{textJTextField}->setText($newKey . $self->{textJTextField}->getText());
        }
}


sub keyIntegerJComboBoxActionPerformed {
    my ($self, $evt) = @_;
        $self->{keyIntegerJComboBox}->getSelectedIndex();
        $self->{keyNameJComboBox}->setSelectedIndex($self->{keyIntegerJComboBox}->getSelectedIndex());
}


sub sequenceJRadioButtonActionPerformed {
    my ($self, $evt) = @_;
        if ($self->{sequenceJRadioButton}->isSelected()) {
            $self->{delayJTextField}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ONE});
            $self->{simultaneousJRadioButton}->setSelected(0);
        }
}


sub simultaneousJRadioButtonActionPerformed {
    my ($self, $evt) = @_;
        if ($self->{simultaneousJRadioButton}->isSelected()) {
            $self->{delayJTextField}->setText('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
            $self->{sequenceJRadioButton}->setSelected(0);
        }
}


sub keyNameJComboBoxActionPerformed {
    my ($self, $evt) = @_;
        my $integer = $self->getSelectedKey();
        $self->prependText($integer);
        $self->{keyIntegerJComboBox}->setSelectedIndex($self->{keyNameJComboBox}->getSelectedIndex());
}


sub okJButtonActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->update();
            $self->getKeyActionJDialog()->setVisible(0);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "okButtonActionPerformed", $e);
        }
}


sub keyActionJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->getKeyActionJDialog()->setVisible(1);
}


sub normalJRadioButtonActionPerformed {
    my ($self, $evt) = @_;
        if ($self->{normalJRadioButton}->isSelected()) {
            $self->{keyActionScriptInputInterface}->setNormal();
            $self->{pressJRadioButton}->setSelected(0);
            $self->{releaseJRadioButton}->setSelected(0);
        }
}


sub releaseJRadioButtonActionPerformed {
    my ($self, $evt) = @_;
        if ($self->{releaseJRadioButton}->isSelected()) {
            $self->{keyActionScriptInputInterface}->setRelease(1);
            $self->{keyActionScriptInputInterface}->setPress(0);
            $self->{pressJRadioButton}->setSelected(0);
            $self->{normalJRadioButton}->setSelected(0);
        }
}


sub pressJRadioButtonActionPerformed {
    my ($self, $evt) = @_;
        if ($self->{pressJRadioButton}->isSelected()) {
            $self->{keyActionScriptInputInterface}->setPress(1);
            $self->{keyActionScriptInputInterface}->setRelease(0);
            $self->{releaseJRadioButton}->setSelected(0);
            $self->{normalJRadioButton}->setSelected(0);
        }
}

# use javax::swing;
use org::allbinary::input::KeySingletonFactory;
use org::allbinary::input::automation::robot::InputRobot;
use org::allbinary::input::automation::robot::InputRobotFactory;
use org::allbinary::input::automation::robot::TempInputRobotNames;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonStrings;
use org::allbinary::input::automation::actions::script::condition::processors::input::DefaultComboBoxModel;
use org::allbinary::input::automation::actions::script::condition::processors::input::KeyNameDefaultComboBoxModelFactory;
use org::allbinary::input::automation::actions::script::condition::processors::input::KeyCharDefaultComboBoxModelFactory;

1;

