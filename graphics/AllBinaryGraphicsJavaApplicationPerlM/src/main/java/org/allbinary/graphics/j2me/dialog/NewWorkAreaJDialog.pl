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

package org::allbinary::graphics::j2me::dialog::NewWorkAreaJDialog;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JDialog';


sub _init_fields {
    my ($self) = @_;
    $self->{parent} = undef;
    $self->{dimension} = undef;
    $self->{xSizeJTextField} = undef;
    $self->{ySizeJTextField} = undef;
    $self->{nameJTextField} = undef;
}


sub new {
    my ($class, $parent, $modal, $dimension, $newName) = @_;
    my $self = $class->SUPER::new($parent, $modal);
    $self->_init_fields();
        # super(...) made $self above
        try {
            $self->initComponents();
            $self->{parent} = $parent;
            $self->{xSizeJTextField} = 'org::allbinary::graphics::j2me::dialog::JTextField'->new("12");
            $self->{ySizeJTextField} = 'org::allbinary::graphics::j2me::dialog::JTextField'->new("12");
            $self->{nameJTextField} = 'org::allbinary::graphics::j2me::dialog::JTextField'->new($newName);
            $self->{dimension} = $dimension;
            my $submitButton = 'org::allbinary::graphics::j2me::dialog::JButton'->new("Ok");
            $submitButton->addActionListener(do {
                package java::awt::event::ActionListener::AnonymousN66301 { our @ISA = ('java::awt::event::ActionListener');
                

                sub actionPerformed {
                    my ($self, $evt) = @_;
                    try {
                        $self->disposeNewDialog();
                    } catch ($e) {
                    }
                }
                }
                'java::awt::event::ActionListener::AnonymousN66301'->can('new') ? 'java::awt::event::ActionListener::AnonymousN66301'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN66301')
            });
            $self->setSize(150, 100);
            $self->getContentPane()->setLayout('org::allbinary::graphics::j2me::dialog::GridLayout'->new(5, 2));
            $self->getContentPane()->add('org::allbinary::graphics::j2me::dialog::JLabel'->new("Please enter"));
            $self->getContentPane()->add('org::allbinary::graphics::j2me::dialog::JLabel'->new(" the size."));
            $self->getContentPane()->add('org::allbinary::graphics::j2me::dialog::JLabel'->new("Name:"));
            $self->getContentPane()->add($self->{nameJTextField});
            $self->getContentPane()->add('org::allbinary::graphics::j2me::dialog::JLabel'->new("X: "));
            $self->getContentPane()->add($self->{xSizeJTextField});
            $self->getContentPane()->add('org::allbinary::graphics::j2me::dialog::JLabel'->new("Y: "));
            $self->getContentPane()->add($self->{ySizeJTextField});
            $self->getContentPane()->add($submitButton);
            $self->show();
        } catch ($e) {
            die $e;
        }
    return $self;
}


# throws Exception
sub disposeNewDialog {
    my ($self) = @_;
        try {
            my $canvasWidth = $self->{xSizeJTextField}->getText();
            my $canvasHeight = $self->{ySizeJTextField}->getText();
            my $newName = $self->{nameJTextField}->getText();
            if (!defined($newName)) {
                die ("No Name", $self, "disposeNewDialog");
            }
            my $workAreaJPanel = 'org::allbinary::graphics::j2me::workarea::WorkAreaJPanel'->new($newName, $self->{dimension}, int($canvasWidth), int($canvasHeight));
            $workAreaJPanel->setLayout('org::allbinary::graphics::j2me::dialog::GridLayout'->new(1, 1));
            $self->{parent}->add($workAreaJPanel);
            $self->dispose();
        } catch ($e) {
            die $e;
        }
}


sub initComponents {
    my ($self) = @_;
        $self->addWindowListener(do {
            package java::awt::event::WindowAdapter::AnonymousN67540 { our @ISA = ('java::awt::event::WindowAdapter');
            

            sub windowClosing {
                my ($self, $evt) = @_;
                $self->closeDialog($evt);
            }
            }
            'java::awt::event::WindowAdapter::AnonymousN67540'->can('new') ? 'java::awt::event::WindowAdapter::AnonymousN67540'->new() : bless({}, 'java::awt::event::WindowAdapter::AnonymousN67540')
        });
        $self->pack();
}


sub closeDialog {
    my ($self, $evt) = @_;
        $self->setVisible(0);
        $self->dispose();
}


sub main {
    my ($class, $args) = @_;
        try {
            'org::allbinary::graphics::j2me::dialog::NewWorkAreaJDialog'->new('org::allbinary::graphics::j2me::MyFrame'->new(), 1, 'org::allbinary::graphics::j2me::dialog::Dimension'->new(100, 100), "testing")->show();
        } catch ($e) {
        }
}

# use java::awt;
# use java::awt::event::ActionEvent;
# use java::awt::event::ActionListener;
# use javax::swing;
use org::allbinary::graphics::j2me::GraphicsException;
use org::allbinary::graphics::j2me::MyFrame;
use org::allbinary::graphics::j2me::workarea::WorkAreaJPanel;
use org::allbinary::graphics::j2me::workarea::WorkAreaJPanelInterface;
use org::allbinary::graphics::j2me::dialog::JTextField;
use org::allbinary::graphics::j2me::dialog::JButton;
use org::allbinary::graphics::j2me::dialog::GridLayout;
use org::allbinary::graphics::j2me::dialog::JLabel;
use org::allbinary::graphics::j2me::dialog::Dimension;

1;

