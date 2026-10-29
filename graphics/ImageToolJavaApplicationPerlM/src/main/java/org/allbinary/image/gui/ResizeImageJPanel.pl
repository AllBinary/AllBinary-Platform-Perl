# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::image::gui::ResizeImageJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel','org::allbinary::media::image::ImageProcessorInputCompositeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{imageProcessorInput} = undef;
    $self->{aboveJButton} = undef;
    $self->{adjustFor16AboveJButton} = undef;
    $self->{adjustFor16BelowJButton} = undef;
    $self->{floatPercentJTextField} = undef;
    $self->{jComboBox1} = undef;
    $self->{jLabel1} = undef;
    $self->{jLabel2} = undef;
    $self->{jLabel3} = undef;
    $self->{jTextField1} = undef;
    $self->{jTextField2} = undef;
    $self->{updateJButton} = undef;
}


sub new {
    my ($class, $imageProcessorInput) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->initComponents();
        $self->{imageProcessorInput} = $imageProcessorInput;
        my $numberStringArray = [(undef) x (101)];
        $numberStringArray->[0] = ("" . (-1));
        for (my $index = 1; $index < 100; $index++) {
            $numberStringArray->[$index] = ("" . ($index));
        }
        $self->{jComboBox1}->setModel('javax::swing::DefaultComboBoxModel'->new($numberStringArray));
        my $araster = $self->{imageProcessorInput}->getBufferedImageArray()->[0]->getAlphaRaster();
        if (!defined($araster)) {
            print("there is no Alpha channel!!!!!!!!!", "\n");
        } else {
            print("Alpha channel found !", "\n");
        }
    return $self;
}


sub process {
    my ($self) = @_;
        do {
            package java::lang::Thread::AnonymousN66634 { our @ISA = ('java::lang::Thread');
            

            sub run {
                my ($self) = @_;
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                try {
                    my $imageUtil = 'org::allbinary::media::image::ImageUtil'->getInstance();
                    my $percent = ("" . ($self->{jComboBox1}->getSelectedItem()));
                    my $percentAsFloat = ($self->{floatPercentJTextField}->getText() + 0);
                    my $imageProcessorInput = $self->getImageProcessorInput();
                    my $files = $imageProcessorInput->getFiles();
                    my $generatedBufferedImageArray = undef;
                    if (int($percentAsFloat) != -1) {
                        $generatedBufferedImageArray = $imageUtil->createBufferedImage2($imageProcessorInput->getBufferedImageArray(), $percentAsFloat, 1);
                    } elsif (int($percent) != -1) {
                        $generatedBufferedImageArray = $imageUtil->createBufferedImageForResize($imageProcessorInput->getBufferedImageArray(), $percent, 1);
                    } else {
                        my $width = ("" . ($self->{jTextField1}->getText()));
                        my $height = ("" . ($self->{jTextField2}->getText()));
                        $generatedBufferedImageArray = $imageUtil->createBufferedImage3($imageProcessorInput->getBufferedImageArray(), $width, $height, 1);
                    }
                    my $araster = $generatedBufferedImageArray->[0]->getAlphaRaster();
                    if (!defined($araster)) {
                        print("No Alpha Channel In Result", "\n");
                    } else {
                        print("Found Alpha Channel In Result", "\n");
                    }
                    my $imagePersistanceUtil = 'org::allbinary::media::image::ImagePersistanceUtil'->getInstance();
                    for (my $index = 0; $index < scalar(@{$generatedBufferedImageArray}); $index++) {
                        $imagePersistanceUtil->saveWithBatik('org::allbinary::logic::io::file::FileWrapperUtil'->wrapFile($files->[$index]), $generatedBufferedImageArray->[$index]);
                    }
                    $self->getParent()->repaint();
                } catch ($e) {
                    $logUtil->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
                }
            }
            }
            'java::lang::Thread::AnonymousN66634'->can('new') ? 'java::lang::Thread::AnonymousN66634'->new() : bless({}, 'java::lang::Thread::AnonymousN66634')
        }->start();
}


sub update {
    my ($self) = @_;
        do {
            package java::lang::Thread::AnonymousN68107 { our @ISA = ('java::lang::Thread');
            

            sub run {
                my ($self) = @_;
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                try {
                    my $imageProcessorInput = $self->getImageProcessorInput();
                    my $size = scalar(@{$imageProcessorInput->getBufferedImageArray()});
                    my $bufferedImageArray = $imageProcessorInput->getBufferedImageArray();
                    my $bufferedImage = undef;
                    for (my $index = 0; $index < $size; $index++) {
                        $bufferedImage = $bufferedImageArray->[0];
                        $self->{jTextField1}->setText(("" . ($bufferedImage->getWidth())));
                        $self->{jTextField2}->setText(("" . ($bufferedImage->getHeight())));
                    }
                    $self->getParent()->repaint();
                } catch ($e) {
                    $logUtil->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
                }
            }
            }
            'java::lang::Thread::AnonymousN68107'->can('new') ? 'java::lang::Thread::AnonymousN68107'->new() : bless({}, 'java::lang::Thread::AnonymousN68107')
        }->start();
}


sub updateFor16Above {
    my ($self) = @_;
        do {
            package java::lang::Thread::AnonymousN68806 { our @ISA = ('java::lang::Thread');
            

            sub run {
                my ($self) = @_;
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                try {
                    my $imageProcessorInput = $self->getImageProcessorInput();
                    my $size = scalar(@{$imageProcessorInput->getBufferedImageArray()});
                    my $bufferedImageArray = $imageProcessorInput->getBufferedImageArray();
                    my $bufferedImage = undef;
                    for (my $index = 0; $index < $size; $index++) {
                        $bufferedImage = $bufferedImageArray->[0];
                        $self->{jTextField1}->setText(("" . ($bufferedImage->getWidth() / 16 * 16)));
                        $self->{jTextField2}->setText(("" . ($bufferedImage->getHeight() / 16 * 16)));
                    }
                    $self->getParent()->repaint();
                } catch ($e) {
                    $logUtil->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
                }
            }
            }
            'java::lang::Thread::AnonymousN68806'->can('new') ? 'java::lang::Thread::AnonymousN68806'->new() : bless({}, 'java::lang::Thread::AnonymousN68806')
        }->start();
}


sub updateFor16Below {
    my ($self) = @_;
        do {
            package java::lang::Thread::AnonymousN69541 { our @ISA = ('java::lang::Thread');
            

            sub run {
                my ($self) = @_;
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                try {
                    my $imageProcessorInput = $self->getImageProcessorInput();
                    my $size = scalar(@{$imageProcessorInput->getBufferedImageArray()});
                    my $bufferedImageArray = $imageProcessorInput->getBufferedImageArray();
                    my $bufferedImage = undef;
                    for (my $index = 0; $index < $size; $index++) {
                        $bufferedImage = $bufferedImageArray->[0];
                        $self->{jTextField1}->setText(("" . ((($bufferedImage->getWidth() / 16) + 1) * 16)));
                        $self->{jTextField2}->setText(("" . ((($bufferedImage->getHeight() / 16) + 1) * 16)));
                    }
                    $self->getParent()->repaint();
                } catch ($e) {
                    $logUtil->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
                }
            }
            }
            'java::lang::Thread::AnonymousN69541'->can('new') ? 'java::lang::Thread::AnonymousN69541'->new() : bless({}, 'java::lang::Thread::AnonymousN69541')
        }->start();
}


sub getImageProcessorInput {
    my ($self) = @_;
        return $self->{imageProcessorInput};
}


sub setImageProcessorInput {
    my ($self, $imageProcessorInput) = @_;
        $self->{imageProcessorInput} = $imageProcessorInput;
}


sub initComponents {
    my ($self) = @_;
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{jComboBox1} = 'javax::swing::JComboBox'->new();
        $self->{aboveJButton} = 'javax::swing::JButton'->new();
        $self->{jTextField1} = 'javax::swing::JTextField'->new();
        $self->{jLabel2} = 'javax::swing::JLabel'->new();
        $self->{jLabel3} = 'javax::swing::JLabel'->new();
        $self->{jTextField2} = 'javax::swing::JTextField'->new();
        $self->{updateJButton} = 'javax::swing::JButton'->new();
        $self->{floatPercentJTextField} = 'javax::swing::JTextField'->new();
        $self->{adjustFor16AboveJButton} = 'javax::swing::JButton'->new();
        $self->{adjustFor16BelowJButton} = 'javax::swing::JButton'->new();
        $self->{jLabel1}->setText("Percent:");
        $self->{jComboBox1}->setModel('javax::swing::DefaultComboBoxModel'->new(["Item 1", "Item 2", "Item 3", "Item 4"]));
        $self->{aboveJButton}->setText("Process");
        $self->{aboveJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71131 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->aboveJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71131'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71131'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71131')
        });
        $self->{jLabel2}->setText("Width:");
        $self->{jLabel3}->setText("Height:");
        $self->{updateJButton}->setText("Update");
        $self->{updateJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71378 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->updateJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71378'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71378'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71378')
        });
        $self->{floatPercentJTextField}->setText("-1.000000");
        $self->{floatPercentJTextField}->setMinimumSize('java::awt::Dimension'->new(120, 22));
        $self->{adjustFor16AboveJButton}->setText("Adjust for 16 Above");
        $self->{adjustFor16AboveJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71660 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->adjustFor16AboveJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71660'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71660'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71660')
        });
        $self->{adjustFor16BelowJButton}->setText("Adjust for 16 Below");
        $self->{adjustFor16BelowJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71847 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->adjustFor16BelowJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71847'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71847'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71847')
        });
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addContainerGap()->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{jLabel1})->addComponent($self->{jLabel2})->addComponent($self->{jLabel3}))->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING}, 0)->addComponent($self->{jComboBox1}, 0, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addComponent($self->{jTextField1})->addComponent($self->{jTextField2}))->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{UNRELATED})->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addComponent($self->{floatPercentJTextField}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{adjustFor16AboveJButton})->addComponent($self->{adjustFor16BelowJButton}))->addContainerGap($org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, 32767))->addGroup($layout->createSequentialGroup()->addComponent($self->{updateJButton})->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{aboveJButton})->addGap(0, 250, 32767)));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addContainerGap()->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel1})->addComponent($self->{jComboBox1}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{floatPercentJTextField}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}))->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jTextField1}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{jLabel2})->addComponent($self->{adjustFor16AboveJButton}))->addPreferredGap($org::allbinary::image::gui::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel3})->addComponent($self->{jTextField2}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::javax::swing->{GroupLayout}->{PREFERRED_SIZE})->addComponent($self->{adjustFor16BelowJButton}))->addGap(18, 18, 18)->addGroup($layout->createParallelGroup($org::allbinary::image::gui::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{aboveJButton})->addComponent($self->{updateJButton}))->addContainerGap(175, 32767)));
}


sub aboveJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->process();
}


sub updateJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->update();
}


sub adjustFor16AboveJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->updateFor16Above();
}


sub adjustFor16BelowJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->updateFor16Below();
}

# use java::awt::image::BufferedImage;
# use java::awt::image::Raster;
use java::io::File;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::FileWrapperUtil;
use org::allbinary::media::image::ImagePersistanceUtil;
use org::allbinary::media::image::ImageProcessorInput;
use org::allbinary::media::image::ImageProcessorInputCompositeInterface;
use org::allbinary::media::image::ImageUtil;
use org::allbinary::string::CommonStrings;
use java::lang::System;
use java::lang::Thread;

1;

