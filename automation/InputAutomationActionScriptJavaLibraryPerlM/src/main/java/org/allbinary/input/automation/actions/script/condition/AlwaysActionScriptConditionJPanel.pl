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

package org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptConditionJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{alwaysActionScriptConditionInterface} = undef;
    $self->{alwaysActionJButton} = undef;
    $self->{alwaysActionJDialog} = undef;
    $self->{alwaysJComboBox} = undef;
    $self->{jLabel1} = undef;
    $self->{jLabel2} = undef;
    $self->{okJButton} = undef;
    $self->{titleJLabel} = undef;
}


sub new {
    my ($class, $alwaysActionScriptConditionInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->initComponents();
        $self->{alwaysActionScriptConditionInterface} = $alwaysActionScriptConditionInterface;
        $self->set();
    return $self;
}


sub set {
    my ($self) = @_;
        if ($self->{alwaysActionScriptConditionInterface}->isIsOn()) {
            $self->{alwaysJComboBox}->setSelectedIndex(0);
        } else {
            $self->{alwaysJComboBox}->setSelectedIndex(1);
        }
        $self->{alwaysActionScriptConditionInterface}->log();
}


sub update {
    my ($self) = @_;
        if ($self->{alwaysJComboBox}->getSelectedIndex() == 0) {
            $self->{alwaysActionScriptConditionInterface}->setIsOn(1);
        } else {
            $self->{alwaysActionScriptConditionInterface}->setIsOn(0);
        }
        $self->{alwaysActionScriptConditionInterface}->log();
}


sub getAlwaysActionJDialog {
    my ($self) = @_;
        return $self->{alwaysActionJDialog};
}


sub setAlwaysActionJDialog {
    my ($self, $alwaysActionJDialog) = @_;
        $self->{alwaysActionJDialog} = $alwaysActionJDialog;
}


sub initComponents {
    my ($self) = @_;
        $self->{alwaysActionJDialog} = 'javax::swing::JDialog'->new();
        $self->{titleJLabel} = 'javax::swing::JLabel'->new();
        $self->{okJButton} = 'javax::swing::JButton'->new();
        $self->{jLabel2} = 'javax::swing::JLabel'->new();
        $self->{alwaysJComboBox} = 'javax::swing::JComboBox'->new();
        $self->{alwaysActionJButton} = 'javax::swing::JButton'->new();
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{alwaysActionJDialog}->setMinimumSize('java::awt::Dimension'->new(250, 150));
        $self->{titleJLabel}->setText("Always Condition Options");
        $self->{okJButton}->setText("OK");
        $self->{okJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN66931 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->okJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN66931'->can('new') ? 'java::awt::event::ActionListener::AnonymousN66931'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN66931')
        });
        $self->{jLabel2}->setText("On:");
        $self->{alwaysJComboBox}->setModel('javax::swing::DefaultComboBoxModel'->new(["true", "false"]));
        my $alwaysActionJDialogLayout = 'javax::swing::GroupLayout'->new($self->{alwaysActionJDialog}->getContentPane());
        $self->{alwaysActionJDialog}->getContentPane()->setLayout($alwaysActionJDialogLayout);
        $alwaysActionJDialogLayout->setHorizontalGroup($alwaysActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($alwaysActionJDialogLayout->createSequentialGroup()->addGroup($alwaysActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($alwaysActionJDialogLayout->createSequentialGroup()->addGap(47, 47, 47)->addGroup($alwaysActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING}, 0)->addGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $alwaysActionJDialogLayout->createSequentialGroup()->addComponent($self->{jLabel2})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addComponent($self->{alwaysJComboBox}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addComponent($self->{titleJLabel})))->addGroup($alwaysActionJDialogLayout->createSequentialGroup()->addGap(79, 79, 79)->addComponent($self->{okJButton})))->addContainerGap(45, 32767)));
        $alwaysActionJDialogLayout->setVerticalGroup($alwaysActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($alwaysActionJDialogLayout->createSequentialGroup()->addContainerGap()->addComponent($self->{titleJLabel})->addGap(20, 20, 20)->addGroup($alwaysActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{alwaysJComboBox}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{jLabel2}))->addGap(15, 15, 15)->addComponent($self->{okJButton})->addContainerGap()));
        $self->setMinimumSize('java::awt::Dimension'->new(100, 0));
        $self->{alwaysActionJButton}->setText("Edit");
        $self->{alwaysActionJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68562 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->alwaysActionJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68562'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68562'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68562')
        });
        $self->{jLabel1}->setText("Always:");
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jLabel1})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED}, 33, 32767)->addComponent($self->{alwaysActionJButton})));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel1})->addComponent($self->{alwaysActionJButton})));
}


sub okJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->update();
        $self->getAlwaysActionJDialog()->setVisible(0);
}


sub alwaysActionJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->getAlwaysActionJDialog()->setVisible(1);
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

