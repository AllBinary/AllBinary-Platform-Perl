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

package org::allbinary::gui::dialog::FileJDialog;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JDialog';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{finishedListenerInterface} = undef;
    $self->{jFileChooser1} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of FileJDialog takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->initComponents();
        $self->getJFileChooser1()->setMultiSelectionEnabled(1);
    return $self;
}


sub _new2 {
    my ($class, $parent, $modal) = @_;
    my $self = $class->SUPER::new($parent, $modal);
    $self->_init_fields();
        # super(...) made $self above
        $self->initComponents();
        $self->getJFileChooser1()->setMultiSelectionEnabled(1);
    return $self;
}


sub addFinishedListener {
    my ($self, $finishedListenerInterface) = @_;
        $self->{finishedListenerInterface} = $finishedListenerInterface;
}


sub initComponents {
    my ($self) = @_;
        $self->{jFileChooser1} = 'javax::swing::JFileChooser'->new();
        $self->setDefaultCloseOperation($org::allbinary::gui::dialog::javax::swing->{WindowConstants}->{DISPOSE_ON_CLOSE});
        $self->{jFileChooser1}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN66188 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->jFileChooser1ActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN66188'->can('new') ? 'java::awt::event::ActionListener::AnonymousN66188'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN66188')
        });
        my $layout = 'org::jdesktop::layout::GroupLayout'->new($self->getContentPane());
        $self->getContentPane()->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::gui::dialog::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($org::allbinary::gui::dialog::org::jdesktop->{layout}->{GroupLayout}->{TRAILING}, $layout->createSequentialGroup()->addContainerGap($org::allbinary::gui::dialog::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)->add($self->{jFileChooser1}, $org::allbinary::gui::dialog::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::gui::dialog::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::gui::dialog::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})->addContainerGap()));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::gui::dialog::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($layout->createSequentialGroup()->addContainerGap()->add($self->{jFileChooser1}, $org::allbinary::gui::dialog::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, 357, $org::allbinary::gui::dialog::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})->addContainerGap($org::allbinary::gui::dialog::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)));
        $self->pack();
}


sub jFileChooser1ActionPerformed {
    my ($self, $evt) = @_;
        $self->{logUtil}->putF("Starting Action Command: " . $evt->getActionCommand(), $self, "ActionPerformed");
        my $files = $self->getJFileChooser1()->getSelectedFiles();
        if ($evt->getActionCommand() == $self->getJFileChooser1()->{CANCEL_SELECTION}) {
            $self->setVisible(0);
        }
        if ($evt->getActionCommand() == $self->getJFileChooser1()->{APPROVE_SELECTION}) {
            if (defined($files) && scalar(@{$files}) > 0) {
                $self->{finishedListenerInterface}->onFiles($files);
            }
        }
}


sub main {
    my ($class, $args) = @_;
        $org::allbinary::gui::dialog::java::awt->{EventQueue}->invokeLater(do {
            package org::allbinary::thread::ARunnable::AnonymousN67597 { our @ISA = ('org::allbinary::thread::ARunnable');
            

            sub run {
                my ($self) = @_;
                'org::allbinary::gui::dialog::FileJDialog'->new('javax::swing::JFrame'->new(), 1)->setVisible(1);
            }
            }
            'org::allbinary::thread::ARunnable::AnonymousN67597'->can('new') ? 'org::allbinary::thread::ARunnable::AnonymousN67597'->new() : bless({}, 'org::allbinary::thread::ARunnable::AnonymousN67597')
        });
}


sub getJFileChooser1 {
    my ($self) = @_;
        return $self->{jFileChooser1};
}


sub setJFileChooser1 {
    my ($self, $jFileChooser1) = @_;
        $self->{jFileChooser1} = $jFileChooser1;
}

use org::allbinary::thread::ARunnable;
use java::io::File;
use org::allbinary::logic::communication::log::LogUtil;

1;

