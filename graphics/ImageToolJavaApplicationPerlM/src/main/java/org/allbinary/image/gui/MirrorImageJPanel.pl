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

package org::allbinary::image::gui::MirrorImageJPanel;
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
    $self->{buttonGroup} = undef;
    $self->{generateJButton} = undef;
    $self->{horizontalJCheckBox} = undef;
    $self->{jLabel2} = undef;
    $self->{jLayeredPane1} = undef;
    $self->{jPanel1} = undef;
    $self->{jPanel2} = undef;
    $self->{jPanel3} = undef;
    $self->{renameJRadioButton} = undef;
    $self->{verticleJCheckBox} = undef;
    $self->{writeOverOriginalJRadioButton} = undef;
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
            package java::lang::Thread::AnonymousN66286 { our @ISA = ('java::lang::Thread');
            

            sub run {
                my ($self) = @_;
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                try {
                    my $imageProcessorInput = $self->getImageProcessorInput();
                    my $bufferedImageArray = $imageProcessorInput->getBufferedImageArray();
                    for (my $index = 0; $index < scalar(@{$bufferedImageArray}); $index++) {
                        $self->{result} = 'org::allbinary::media::image::MirrorImageUtil'->getInstance()->getImage($bufferedImageArray->[$index], $self->{verticleJCheckBox}->isSelected(), $self->{horizontalJCheckBox}->isSelected());
                        my $file = $imageProcessorInput->getFiles()->[$index];
                        if ($self->{writeOverOriginalJRadioButton}->isSelected()) {
                        } elsif ($self->{renameJRadioButton}->isSelected()) {
                            my $filePath = $file->getAbsolutePath();
                            my $extensionIndex = index($filePath, $self->{imageStrings}->{PNG_EXTENSION});
                            $filePath = substr($filePath, 0, ($extensionIndex) - (0)) . "_mirror" . $self->{imageStrings}->{PNG_EXTENSION};
                            $logUtil->putF("Renamed File: " . $filePath, $self, $self->{commonStrings}->{RUN});
                            $file = 'java::io::File'->new($filePath);
                        }
                        my $isWritten = 'javax::imageio::ImageIO'->write($self->{result}, $self->{imageStrings}->{PNG}, $file);
                        $logUtil->putF("File: " . $file . " Wrote: " . $isWritten, $self, $self->{commonStrings}->{RUN});
                        $self->getParent()->repaint();
                    }
                } catch ($e) {
                    $logUtil->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
                }
            }
            }
            'java::lang::Thread::AnonymousN66286'->can('new') ? 'java::lang::Thread::AnonymousN66286'->new() : bless({}, 'java::lang::Thread::AnonymousN66286')
        }->start();
}


sub initComponents {
    my ($self) = @_;
        $self->{jLayeredPane1} = 'javax::swing::JLayeredPane'->new();
        $self->{buttonGroup} = 'javax::swing::ButtonGroup'->new();
        $self->{jPanel1} = do {
            package javax::swing::JPanel::AnonymousN67539 { our @ISA = ('javax::swing::JPanel');
            

            sub paint {
                my ($self, $graphics) = @_;
                if (defined($self->{result})) {
                    $graphics->drawImage($self->{result}, 0, 0, $self->{result}->getWidth(undef), $self->{result}->getHeight(undef), undef);
                }
            }
            }
            'javax::swing::JPanel::AnonymousN67539'->can('new') ? 'javax::swing::JPanel::AnonymousN67539'->new() : bless({}, 'javax::swing::JPanel::AnonymousN67539')
        };
        $self->{jPanel2} = 'javax::swing::JPanel'->new();
        $self->{horizontalJCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{verticleJCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{generateJButton} = 'javax::swing::JButton'->new();
        $self->{renameJRadioButton} = 'javax::swing::JRadioButton'->new();
        $self->{writeOverOriginalJRadioButton} = 'javax::swing::JRadioButton'->new();
        $self->{jPanel3} = 'javax::swing::JPanel'->new();
        $self->{jLabel2} = 'javax::swing::JLabel'->new();
        my $jPanel1Layout = 'org::jdesktop::layout::GroupLayout'->new($self->{jPanel1});
        $self->{jPanel1}->setLayout($jPanel1Layout);
        $jPanel1Layout->setHorizontalGroup($jPanel1Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add(0, 522, 32767));
        $jPanel1Layout->setVerticalGroup($jPanel1Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add(0, 230, 32767));
        $self->{horizontalJCheckBox}->setSelected(1);
        $self->{horizontalJCheckBox}->setText("Horizontal");
        $self->{horizontalJCheckBox}->setEnabled(0);
        $self->{verticleJCheckBox}->setText("Verticle");
        $self->{verticleJCheckBox}->setEnabled(0);
        $self->{generateJButton}->setText("Generate");
        $self->{generateJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68718 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->generateJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68718'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68718'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68718')
        });
        $self->{renameJRadioButton}->setText("Save As filename_mirror");
        $self->{renameJRadioButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN68905 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->renameJRadioButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN68905'->can('new') ? 'java::awt::event::ActionListener::AnonymousN68905'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN68905')
        });
        $self->{writeOverOriginalJRadioButton}->setText("Write Over Original");
        my $jPanel2Layout = 'org::jdesktop::layout::GroupLayout'->new($self->{jPanel2});
        $self->{jPanel2}->setLayout($jPanel2Layout);
        $jPanel2Layout->setHorizontalGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($jPanel2Layout->createSequentialGroup()->addContainerGap($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)->add($self->{verticleJCheckBox})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{UNRELATED})->add($self->{horizontalJCheckBox})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($self->{writeOverOriginalJRadioButton})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{UNRELATED})->add($self->{renameJRadioButton})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($self->{generateJButton})->add(37, 37, 37)));
        $jPanel2Layout->setVerticalGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($jPanel2Layout->createSequentialGroup()->add($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{BASELINE})->add($self->{horizontalJCheckBox})->add($self->{verticleJCheckBox})->add($self->{writeOverOriginalJRadioButton})->add($self->{renameJRadioButton})->add($self->{generateJButton}))->addContainerGap()));
        $self->{jLabel2}->setText("Results:");
        my $jPanel3Layout = 'org::jdesktop::layout::GroupLayout'->new($self->{jPanel3});
        $self->{jPanel3}->setLayout($jPanel3Layout);
        $jPanel3Layout->setHorizontalGroup($jPanel3Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($jPanel3Layout->createSequentialGroup()->add($self->{jLabel2})->addContainerGap(433, 32767)));
        $jPanel3Layout->setVerticalGroup($jPanel3Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($self->{jLabel2}));
        my $layout = 'org::jdesktop::layout::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{TRAILING}, $layout->createSequentialGroup()->addContainerGap()->add($self->{jPanel3}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addContainerGap())->add($self->{jPanel1}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)->add($layout->createSequentialGroup()->add($self->{jPanel2}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addContainerGap($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($layout->createSequentialGroup()->add($self->{jPanel2}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, 25, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($self->{jPanel3}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($self->{jPanel1}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)));
}


sub generateJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->process();
}


sub renameJRadioButtonActionPerformed {
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
use org::allbinary::media::image::ImageProcessorInput;
use org::allbinary::media::image::ImageProcessorInputCompositeInterface;
use org::allbinary::media::image::ImageStrings;
use org::allbinary::media::image::MirrorImageUtil;
use org::allbinary::string::CommonStrings;
use java::lang::Thread;

1;

