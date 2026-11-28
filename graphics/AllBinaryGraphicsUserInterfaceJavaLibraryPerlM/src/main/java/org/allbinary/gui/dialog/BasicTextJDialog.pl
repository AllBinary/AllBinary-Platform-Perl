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

package org::allbinary::gui::dialog::BasicTextJDialog;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{closeListenerInterface} = undef unless exists $self->{closeListenerInterface};
    $self->{jButton1} = undef unless exists $self->{jButton1};
    $self->{textJLabel} = undef unless exists $self->{textJLabel};
}

sub new {
    my ($class, @arguments) = @_;
    return _new3($class, @arguments) if scalar(@arguments) == 3;
    return _new1($class, @arguments) if scalar(@arguments) == 1;
    die "No constructor of BasicTextJDialog takes " . scalar(@arguments) . " arguments";
}


sub _new3 {
    my ($class, $parent, $modal, $text) = @_;
    my $self = $class->SUPER::new($parent, $modal);
    _init_fields($self);
        # super(...) made $self above
        $self->initComponents();
        $self->setText($text);
    return $self;
}


sub setText {
    my ($self, $text) = @_;
        $self->{textJLabel}->setText($text);
}


sub addCloseListener {
    my ($self, $closeListenerInterface) = @_;
        $self->{closeListenerInterface} = $closeListenerInterface;
}


sub _new1 {
    my ($class, $text) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->initComponents();
        $self->{textJLabel}->setText($text);
    return $self;
}


sub initComponents {
    my ($self) = @_;
        $self->{jButton1} = 'javax::swing::JButton'->new();
        $self->{textJLabel} = 'javax::swing::JLabel'->new();
        $self->setDefaultCloseOperation($javax::swing::WindowConstants::DISPOSE_ON_CLOSE);
        $self->{jButton1}->setText("OK");
        $self->{jButton1}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN66400 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->jButton1ActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN66400'->can('new') ? 'java::awt::event::ActionListener::AnonymousN66400'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN66400')
        });
        $self->{textJLabel}->setText("No Text Set");
        my $layout = 'javax::swing::GroupLayout'->new($self->getContentPane());
        $self->getContentPane()->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($layout->createSequentialGroup()->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($layout->createSequentialGroup()->addGap(80, 80, 80)->addComponent($self->{jButton1}))->addGroup($layout->createSequentialGroup()->addContainerGap()->addComponent($self->{textJLabel}, $javax::swing::GroupLayout::DEFAULT_SIZE, 184, 32767)))->addContainerGap()));
        $layout->setVerticalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($layout->createSequentialGroup()->addGap(20, 20, 20)->addComponent($self->{textJLabel}, $javax::swing::GroupLayout::PREFERRED_SIZE, 20, $javax::swing::GroupLayout::PREFERRED_SIZE)->addGap(30, 30, 30)->addComponent($self->{jButton1})));
        $self->pack();
}


sub jButton1ActionPerformed {
    my ($self, $evt) = @_;
        $self->setVisible(0);
        if (defined($self->{closeListenerInterface})) {
            $self->{closeListenerInterface}->onClose();
        }
}


sub main {
    my ($class, $args) = @_;
        'java::awt::EventQueue'->invokeLater(do {
            package org::allbinary::thread::ARunnable::AnonymousN67327 { our @ISA = ('org::allbinary::thread::ARunnable', 'java::lang::Object');
            

            sub run {
                my ($self) = @_;
                'org::allbinary::gui::dialog::BasicTextJDialog'->new('javax::swing::JFrame'->new(), 1, "Test")->setVisible(1);
            }
            }
            'org::allbinary::thread::ARunnable::AnonymousN67327'->can('new') ? 'org::allbinary::thread::ARunnable::AnonymousN67327'->new() : bless({}, 'org::allbinary::thread::ARunnable::AnonymousN67327')
        });
}

use java::lang::Object ();
use org::allbinary::thread::ARunnable ();
# use java::awt::EventQueue ();
# use java::awt::Frame ();
# use java::awt::event::ActionEvent ();
# use java::awt::event::ActionListener ();
# use javax::swing::GroupLayout ();
# use javax::swing::JButton ();
# use javax::swing::JDialog ();
# use javax::swing::JFrame ();
# use javax::swing::JLabel ();
# use javax::swing::WindowConstants ();

1;

