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

package org::allbinary::image::gui::MirrorSpriteImageJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel','org::allbinary::media::image::ImageProcessorInputCompositeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{imageStrings} = 'org::allbinary::media::image::ImageStrings'->getInstance();
    $self->{imageProcessorInput} = undef;
    $self->{result} = undef;
    $self->{generateJButton} = undef;
    $self->{horizontalJCheckBox} = undef;
    $self->{imageHeightIsFrameSizeJCheckBox} = undef;
    $self->{jLabel2} = undef;
    $self->{jLayeredPane1} = undef;
    $self->{jPanel1} = undef;
    $self->{jPanel2} = undef;
    $self->{jPanel3} = undef;
    $self->{verticleJCheckBox} = undef;
    $self->{writeOverOriginalJCheckBox} = undef;
}


sub new {
    my ($class, $imageProcessorInput) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF("Starting", $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->initComponents();
        $self->{imageProcessorInput} = $imageProcessorInput;
    return $self;
}


sub process {
    my ($self) = @_;
        do {
            package java::lang::Thread::AnonymousN66316 { our @ISA = ('java::lang::Thread');
            

            sub run {
                my ($self) = @_;
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                try {
                    my $generatedBufferedImageArray = undef;
                    my $imageProcessorInput = $self->getImageProcessorInput();
                    my $bufferedImageArray = $imageProcessorInput->getBufferedImageArray();
                    for (my $index = 0; $index < scalar(@{$bufferedImageArray}); $index++) {
                        $generatedBufferedImageArray = 'org::allbinary::media::image::MirrorImageUtil'->getInstance()->getImages($bufferedImageArray->[$index], $self->{verticleJCheckBox}->isSelected(), $self->{horizontalJCheckBox}->isSelected());
                        $self->{result} = 'org::allbinary::media::image::BufferedImageUtil2'->getInstance()->createSpriteImage($generatedBufferedImageArray);
                        $self->getParent()->repaint();
                        my $file = $imageProcessorInput->getFiles()->[$index];
                        if (!$self->{writeOverOriginalJCheckBox}->isSelected()) {
                            my $filePath = $file->getAbsolutePath();
                            my $extensionIndex = index($filePath, $self->{imageStrings}->{PNG_EXTENSION});
                            $filePath = substr($filePath, 0, ($extensionIndex) - (0)) . "_mirror" . $self->{imageStrings}->{PNG_EXTENSION};
                            $logUtil->putF("Renamed File: " . $filePath, $self, $self->{commonStrings}->{RUN});
                            $file = 'java::io::File'->new($filePath);
                        }
                        my $isWritten = 'javax::imageio::ImageIO'->write($self->{result}, $self->{imageStrings}->{PNG}, $file);
                        $logUtil->putF("File: " . $file . " Wrote: " . $isWritten, $self, $self->{commonStrings}->{RUN});
                    }
                } catch ($e) {
                    $logUtil->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
                }
            }
            }
            'java::lang::Thread::AnonymousN66316'->can('new') ? 'java::lang::Thread::AnonymousN66316'->new() : bless({}, 'java::lang::Thread::AnonymousN66316')
        }->start();
}


sub initComponents {
    my ($self) = @_;
        $self->{jLayeredPane1} = 'javax::swing::JLayeredPane'->new();
        $self->{jPanel1} = do {
            package javax::swing::JPanel::AnonymousN67571 { our @ISA = ('javax::swing::JPanel');
            

            sub paint {
                my ($self, $graphics) = @_;
                if (defined($self->{result})) {
                    $graphics->drawImage($self->{result}, 0, 0, $self->{result}->getWidth(undef), $self->{result}->getHeight(undef), undef);
                }
            }
            }
            'javax::swing::JPanel::AnonymousN67571'->can('new') ? 'javax::swing::JPanel::AnonymousN67571'->new() : bless({}, 'javax::swing::JPanel::AnonymousN67571')
        };
        $self->{jPanel2} = 'javax::swing::JPanel'->new();
        $self->{imageHeightIsFrameSizeJCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{horizontalJCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{verticleJCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{writeOverOriginalJCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{generateJButton} = 'javax::swing::JButton'->new();
        $self->{jPanel3} = 'javax::swing::JPanel'->new();
        $self->{jLabel2} = 'javax::swing::JLabel'->new();
        my $jPanel1Layout = 'org::jdesktop::layout::GroupLayout'->new($self->{jPanel1});
        $self->{jPanel1}->setLayout($jPanel1Layout);
        $jPanel1Layout->setHorizontalGroup($jPanel1Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add(0, 507, 32767));
        $jPanel1Layout->setVerticalGroup($jPanel1Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add(0, 230, 32767));
        $self->{imageHeightIsFrameSizeJCheckBox}->setSelected(1);
        $self->{imageHeightIsFrameSizeJCheckBox}->setText("Image Height Is Frame Size");
        $self->{imageHeightIsFrameSizeJCheckBox}->setEnabled(0);
        $self->{imageHeightIsFrameSizeJCheckBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68660 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->imageHeightIsFrameSizeJCheckBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68660'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68660'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68660')
        });
        $self->{horizontalJCheckBox}->setSelected(1);
        $self->{horizontalJCheckBox}->setText("Horizontal");
        $self->{horizontalJCheckBox}->setEnabled(0);
        $self->{verticleJCheckBox}->setText("Verticle");
        $self->{verticleJCheckBox}->setEnabled(0);
        $self->{writeOverOriginalJCheckBox}->setText("Write Over Original");
        $self->{generateJButton}->setText("Generate");
        $self->{generateJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69031 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->generateJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69031'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69031'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69031')
        });
        my $jPanel2Layout = 'org::jdesktop::layout::GroupLayout'->new($self->{jPanel2});
        $self->{jPanel2}->setLayout($jPanel2Layout);
        $jPanel2Layout->setHorizontalGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($jPanel2Layout->createSequentialGroup()->addContainerGap($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)->add($self->{verticleJCheckBox})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{UNRELATED})->add($self->{horizontalJCheckBox})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($self->{imageHeightIsFrameSizeJCheckBox})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($self->{writeOverOriginalJCheckBox})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($self->{generateJButton})));
        $jPanel2Layout->setVerticalGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($jPanel2Layout->createSequentialGroup()->add($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{BASELINE})->add($self->{imageHeightIsFrameSizeJCheckBox}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)->add($self->{horizontalJCheckBox})->add($self->{verticleJCheckBox})->add($self->{writeOverOriginalJCheckBox})->add($self->{generateJButton}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, 25, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}))->addContainerGap()));
        $self->{jLabel2}->setText("Results:");
        my $jPanel3Layout = 'org::jdesktop::layout::GroupLayout'->new($self->{jPanel3});
        $self->{jPanel3}->setLayout($jPanel3Layout);
        $jPanel3Layout->setHorizontalGroup($jPanel3Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($jPanel3Layout->createSequentialGroup()->add($self->{jLabel2})->addContainerGap(448, 32767)));
        $jPanel3Layout->setVerticalGroup($jPanel3Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($self->{jLabel2}));
        my $layout = 'org::jdesktop::layout::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{TRAILING}, $layout->createSequentialGroup()->addContainerGap()->add($self->{jPanel3}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addContainerGap())->add($self->{jPanel1}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)->add($layout->createSequentialGroup()->add($self->{jPanel2}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})->addContainerGap($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($layout->createSequentialGroup()->add($self->{jPanel2}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, 25, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($self->{jPanel3}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($self->{jPanel1}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)));
}


sub generateJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->process();
}


sub imageHeightIsFrameSizeJCheckBoxActionPerformed {
    my ($self, $evt) = @_;
}


sub getImageProcessorInput {
    my ($self) = @_;
        return $self->{imageProcessorInput};
}


sub setImageProcessorInput {
    my ($self, $imageProcessorInput) = @_;
        $self->{imageProcessorInput} = $imageProcessorInput;
}

# use java::awt;
# use java::awt::image::BufferedImage;
# use java::awt::image::RenderedImage;
use java::io::File;
# use javax::imageio::ImageIO;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::media::image::BufferedImageUtil2;
use org::allbinary::media::image::ImageProcessorInput;
use org::allbinary::media::image::ImageProcessorInputCompositeInterface;
use org::allbinary::media::image::ImageStrings;
use org::allbinary::media::image::MirrorImageUtil;
use org::allbinary::string::CommonStrings;
use java::lang::Thread;

1;

