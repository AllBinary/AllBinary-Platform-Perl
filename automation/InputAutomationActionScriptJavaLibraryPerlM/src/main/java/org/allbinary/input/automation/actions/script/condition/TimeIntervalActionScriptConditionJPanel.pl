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

package org::allbinary::input::automation::actions::script::condition::TimeIntervalActionScriptConditionJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{timeIntervalActionScriptConditionInterface} = undef;
    $self->{jLabel1} = undef;
    $self->{jLabel2} = undef;
    $self->{okJButton} = undef;
    $self->{timeIntervalActionJButton} = undef;
    $self->{timeIntervalActionJDialog} = undef;
    $self->{timeIntervalJTextField} = undef;
    $self->{titleJLabel} = undef;
}


sub new {
    my ($class, $timeIntervalActionScriptConditionInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->initComponents();
        $self->{timeIntervalActionScriptConditionInterface} = $timeIntervalActionScriptConditionInterface;
        $self->set();
    return $self;
}


sub set {
    my ($self) = @_;
        $self->getTimeIntervalJTextField()->setText(("" . ($self->{timeIntervalActionScriptConditionInterface}->getTimeDelayHelper()->{delay})));
        $self->{timeIntervalActionScriptConditionInterface}->log();
}


sub update {
    my ($self) = @_;
        $self->{timeIntervalActionScriptConditionInterface}->getTimeDelayHelper()->{delay} = ("" . ($self->getTimeIntervalJTextField()->getText()));
        $self->{timeIntervalActionScriptConditionInterface}->log();
}


sub getTimeIntervalJTextField {
    my ($self) = @_;
        return $self->{timeIntervalJTextField};
}


sub setTimeIntervalJTextField {
    my ($self, $timeIntervalJTextField) = @_;
        $self->{timeIntervalJTextField} = $timeIntervalJTextField;
}


sub getTimeIntervalActionJDialog {
    my ($self) = @_;
        return $self->{timeIntervalActionJDialog};
}


sub setTimeIntervalActionJDialog {
    my ($self, $timeIntervalActionJDialog) = @_;
        $self->{timeIntervalActionJDialog} = $timeIntervalActionJDialog;
}


sub initComponents {
    my ($self) = @_;
        $self->{timeIntervalActionJDialog} = 'javax::swing::JDialog'->new();
        $self->{titleJLabel} = 'javax::swing::JLabel'->new();
        $self->{okJButton} = 'javax::swing::JButton'->new();
        $self->{jLabel2} = 'javax::swing::JLabel'->new();
        $self->{timeIntervalJTextField} = 'javax::swing::JTextField'->new();
        $self->{timeIntervalActionJButton} = 'javax::swing::JButton'->new();
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{timeIntervalActionJDialog}->setMinimumSize('java::awt::Dimension'->new(250, 150));
        $self->{titleJLabel}->setText("Time Interval Condition Options");
        $self->{okJButton}->setText("OK");
        $self->{okJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN67024 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->okJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN67024'->can('new') ? 'java::awt::event::ActionListener::AnonymousN67024'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN67024')
        });
        $self->{jLabel2}->setText("Time (ms):");
        my $timeIntervalActionJDialogLayout = 'javax::swing::GroupLayout'->new($self->{timeIntervalActionJDialog}->getContentPane());
        $self->{timeIntervalActionJDialog}->getContentPane()->setLayout($timeIntervalActionJDialogLayout);
        $timeIntervalActionJDialogLayout->setHorizontalGroup($timeIntervalActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($timeIntervalActionJDialogLayout->createSequentialGroup()->addGroup($timeIntervalActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{TRAILING})->addGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING}, $timeIntervalActionJDialogLayout->createSequentialGroup()->addGap(82, 82, 82)->addComponent($self->{okJButton}))->addGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING}, $timeIntervalActionJDialogLayout->createSequentialGroup()->addGap(32, 32, 32)->addGroup($timeIntervalActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($timeIntervalActionJDialogLayout->createSequentialGroup()->addComponent($self->{jLabel2})->addGap(16, 16, 16)->addComponent($self->{timeIntervalJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 85, 32767))->addComponent($self->{titleJLabel}))))->addContainerGap(36, 32767)));
        $timeIntervalActionJDialogLayout->setVerticalGroup($timeIntervalActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($timeIntervalActionJDialogLayout->createSequentialGroup()->addContainerGap()->addComponent($self->{titleJLabel})->addGap(20, 20, 20)->addGroup($timeIntervalActionJDialogLayout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel2})->addComponent($self->{timeIntervalJTextField}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addGap(15, 15, 15)->addComponent($self->{okJButton})->addContainerGap()));
        $self->setMinimumSize('java::awt::Dimension'->new(100, 0));
        $self->{timeIntervalActionJButton}->setText("Edit");
        $self->{timeIntervalActionJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68481 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->timeIntervalActionJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68481'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68481'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68481')
        });
        $self->{jLabel1}->setText("Time Interval:");
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jLabel1})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED}, $org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addComponent($self->{timeIntervalActionJButton})));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel1})->addComponent($self->{timeIntervalActionJButton})));
}


sub okJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->update();
        $self->getTimeIntervalActionJDialog()->setVisible(0);
}


sub timeIntervalActionJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->getTimeIntervalActionJDialog()->setVisible(1);
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

