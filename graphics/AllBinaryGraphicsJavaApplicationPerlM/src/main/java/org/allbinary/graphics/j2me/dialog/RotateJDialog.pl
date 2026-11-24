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

package org::allbinary::graphics::j2me::dialog::RotateJDialog;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{hashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
    $self->{angleIncrementJTextField} = undef;
    $self->{jButton1} = undef;
    $self->{jLabel1} = undef;
    $self->{jLabel2} = undef;
    $self->{jPanel1} = undef;
    $self->{totalRotationJTextField} = undef;
}


sub new {
    my ($class, $parent, $modal) = @_;
    my $self = $class->SUPER::new($parent, $modal);
    _init_fields($self);
        # super(...) made $self above
        $self->initComponents();
    return $self;
}


sub initComponents {
    my ($self) = @_;
        $self->{angleIncrementJTextField} = 'javax::swing::JTextField'->new();
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{totalRotationJTextField} = 'javax::swing::JTextField'->new();
        $self->{jLabel2} = 'javax::swing::JLabel'->new();
        $self->{jPanel1} = 'javax::swing::JPanel'->new();
        $self->{jButton1} = 'javax::swing::JButton'->new();
        $self->setDefaultCloseOperation($javax::swing::WindowConstants::DISPOSE_ON_CLOSE);
        $self->{angleIncrementJTextField}->setText("36");
        $self->{jLabel1}->setText("Angle Increment:");
        $self->{totalRotationJTextField}->setText("360");
        $self->{jLabel2}->setText("Total Angular Rotation:");
        $self->{jButton1}->setText("OK");
        $self->{jButton1}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN66686 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->jButton1ActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN66686'->can('new') ? 'java::awt::event::ActionListener::AnonymousN66686'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN66686')
        });
        my $jPanel1Layout = 'javax::swing::GroupLayout'->new($self->{jPanel1});
        $self->{jPanel1}->setLayout($jPanel1Layout);
        $jPanel1Layout->setHorizontalGroup($jPanel1Layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($jPanel1Layout->createSequentialGroup()->addGap(62, 62, 62)->addComponent($self->{jButton1})->addContainerGap(62, 32767)));
        $jPanel1Layout->setVerticalGroup($jPanel1Layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{jButton1}));
        my $layout = 'javax::swing::GroupLayout'->new($self->getContentPane());
        $self->getContentPane()->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($layout->createSequentialGroup()->addContainerGap()->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{TRAILING})->addComponent($self->{jLabel1})->addComponent($self->{jLabel2}))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{UNRELATED})->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addComponent($self->{totalRotationJTextField}, $javax::swing::GroupLayout::Alignment->{TRAILING}, $javax::swing::GroupLayout::DEFAULT_SIZE, 31, 32767)->addComponent($self->{angleIncrementJTextField}, $javax::swing::GroupLayout::Alignment->{TRAILING}, $javax::swing::GroupLayout::PREFERRED_SIZE, 31, $javax::swing::GroupLayout::PREFERRED_SIZE))->addContainerGap())->addComponent($self->{jPanel1}, $javax::swing::GroupLayout::Alignment->{TRAILING}, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, 32767));
        $layout->setVerticalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($layout->createSequentialGroup()->addContainerGap()->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{angleIncrementJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{jLabel1}))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{totalRotationJTextField}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addComponent($self->{jLabel2}))->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED}, 16, 32767)->addComponent($self->{jPanel1}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)->addContainerGap()));
        $self->pack();
}


sub jButton1ActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->{hashMap}->put(("" . (0)), ("" . ($self->{angleIncrementJTextField}->getText())));
            $self->{hashMap}->put(("" . (1)), ("" . ($self->{totalRotationJTextField}->getText())));
            ($self->getParent())->onHashMap($self->{hashMap});
            $self->setVisible(0);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF($commonStrings->{EXCEPTION}, $self, "jButton1ActionPerformed");
        }
}


sub main {
    my ($class, $args) = @_;
        'java::awt::EventQueue'->invokeLater(do {
            package org::allbinary::thread::ARunnable::AnonymousN68780 { our @ISA = ('org::allbinary::thread::ARunnable', 'java::lang::Object');
            

            sub run {
                my ($self) = @_;
                my $dialog = 'org::allbinary::graphics::j2me::dialog::RotateJDialog'->new('javax::swing::JFrame'->new(), 1);
                $dialog->addWindowListener(do {
                    package java::awt::event::WindowAdapter::AnonymousN68879 { our @ISA = ('java::awt::event::WindowAdapter', 'java::lang::Object');
                    

                    sub windowClosing {
                        my ($self, $e) = @_;
                        exit(0);
                    }
                    }
                    'java::awt::event::WindowAdapter::AnonymousN68879'->can('new') ? 'java::awt::event::WindowAdapter::AnonymousN68879'->new() : bless({}, 'java::awt::event::WindowAdapter::AnonymousN68879')
                });
                $dialog->setVisible(1);
            }
            }
            'org::allbinary::thread::ARunnable::AnonymousN68780'->can('new') ? 'org::allbinary::thread::ARunnable::AnonymousN68780'->new() : bless({}, 'org::allbinary::thread::ARunnable::AnonymousN68780')
        });
}

use java::lang::Object ();
use org::allbinary::thread::ARunnable ();
use java::util::HashMap ();
use org::allbinary::gui::dialog::HashMapJDialogListenerInterface ();
use org::allbinary::logic::StdUtil ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::string::CommonStrings ();
# use java::awt::EventQueue ();
# use java::awt::Frame ();
# use java::awt::event::ActionEvent ();
# use java::awt::event::ActionListener ();
# use java::awt::event::WindowAdapter ();
# use java::awt::event::WindowEvent ();
# use javax::swing::GroupLayout ();
# use javax::swing::JButton ();
# use javax::swing::JDialog ();
# use javax::swing::JFrame ();
# use javax::swing::JLabel ();
# use javax::swing::JPanel ();
# use javax::swing::JTextField ();
# use javax::swing::LayoutStyle ();
# use javax::swing::WindowConstants ();
use java::lang::System ();

1;

