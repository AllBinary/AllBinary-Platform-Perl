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

package org::allbinary::image::gui::RotationImageJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel','org::allbinary::media::image::ImageProcessedVisitor';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{imageStrings} = 'org::allbinary::media::image::ImageStrings'->getInstance();
    $self->{imageProcessorInput} = undef;
    $self->{result} = undef;
    $self->{generateJButton} = undef;
    $self->{jLabel1} = undef;
    $self->{jLabel2} = undef;
    $self->{jLabel3} = undef;
    $self->{jPanel1} = undef;
    $self->{jPanel2} = undef;
    $self->{jPanel3} = undef;
    $self->{totalAngleJComboBox} = undef;
    $self->{writeOverOriginalJCheckBox} = undef;
}


sub new {
    my ($class, $imageProcessorInput) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->initComponents();
        $self->{imageProcessorInput} = $imageProcessorInput;
    return $self;
}


sub process {
    my ($self) = @_;
        do {
            package java::lang::Thread::AnonymousN66309 { our @ISA = ('java::lang::Thread');
            

            sub run {
                my ($self) = @_;
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                try {
                    my $angleAsString = $self->{totalAngleJComboBox}->getSelectedItem();
                    'org::allbinary::media::image::ImageArrayRotationUtil'->getInstance()->process($self->getImageProcessorInput(), $angleAsString, $self);
                } catch ($e) {
                    $logUtil->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
                }
            }
            }
            'java::lang::Thread::AnonymousN66309'->can('new') ? 'java::lang::Thread::AnonymousN66309'->new() : bless({}, 'java::lang::Thread::AnonymousN66309')
        }->start();
}


sub initComponents {
    my ($self) = @_;
        $self->{jPanel1} = do {
            package javax::swing::JPanel::AnonymousN66685 { our @ISA = ('javax::swing::JPanel');
            

            sub paint {
                my ($self, $graphics) = @_;
                if (defined($self->{result})) {
                    $graphics->drawImage($self->{result}, 0, 0, $self->{result}->getWidth(undef), $self->{result}->getHeight(undef), undef);
                }
            }
            }
            'javax::swing::JPanel::AnonymousN66685'->can('new') ? 'javax::swing::JPanel::AnonymousN66685'->new() : bless({}, 'javax::swing::JPanel::AnonymousN66685')
        };
        $self->{jPanel2} = 'javax::swing::JPanel'->new();
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{generateJButton} = 'javax::swing::JButton'->new();
        $self->{totalAngleJComboBox} = 'javax::swing::JComboBox'->new();
        $self->{jLabel3} = 'javax::swing::JLabel'->new();
        $self->{writeOverOriginalJCheckBox} = 'javax::swing::JCheckBox'->new();
        $self->{jPanel3} = 'javax::swing::JPanel'->new();
        $self->{jLabel2} = 'javax::swing::JLabel'->new();
        my $jPanel1Layout = 'org::jdesktop::layout::GroupLayout'->new($self->{jPanel1});
        $self->{jPanel1}->setLayout($jPanel1Layout);
        $jPanel1Layout->setHorizontalGroup($jPanel1Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add(0, 436, 32767));
        $jPanel1Layout->setVerticalGroup($jPanel1Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add(0, 227, 32767));
        $self->{generateJButton}->setText("Generate");
        $self->{generateJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN67714 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->generateJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN67714'->can('new') ? 'java::awt::event::ActionListener::AnonymousN67714'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN67714')
        });
        $self->{totalAngleJComboBox}->setModel('javax::swing::DefaultComboBoxModel'->new([$self->{commonStrings}->{UP}, $self->{commonStrings}->{DOWN}, "-90", "90"]));
        $self->{totalAngleJComboBox}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN67999 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->totalAngleJComboBoxActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN67999'->can('new') ? 'java::awt::event::ActionListener::AnonymousN67999'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN67999')
        });
        $self->{jLabel3}->setText("Total Angle:");
        $self->{writeOverOriginalJCheckBox}->setText("Write Over Original");
        my $jPanel2Layout = 'org::jdesktop::layout::GroupLayout'->new($self->{jPanel2});
        $self->{jPanel2}->setLayout($jPanel2Layout);
        $jPanel2Layout->setHorizontalGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($jPanel2Layout->createSequentialGroup()->add(8, 8, 8)->add($self->{jLabel1})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($self->{jLabel3})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($self->{totalAngleJComboBox}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($self->{writeOverOriginalJCheckBox})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($self->{generateJButton})->addContainerGap($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)));
        $jPanel2Layout->setVerticalGroup($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($jPanel2Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{BASELINE})->add($self->{jLabel1})->add($self->{generateJButton})->add($self->{totalAngleJComboBox}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})->add($self->{jLabel3})->add($self->{writeOverOriginalJCheckBox})));
        $self->{jLabel2}->setText("Results:");
        my $jPanel3Layout = 'org::jdesktop::layout::GroupLayout'->new($self->{jPanel3});
        $self->{jPanel3}->setLayout($jPanel3Layout);
        $jPanel3Layout->setHorizontalGroup($jPanel3Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($jPanel3Layout->createSequentialGroup()->add($self->{jLabel2})->addContainerGap(377, 32767)));
        $jPanel3Layout->setVerticalGroup($jPanel3Layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($self->{jLabel2}));
        my $layout = 'org::jdesktop::layout::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{TRAILING}, $self->{jPanel2}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)->add($layout->createSequentialGroup()->addContainerGap()->add($self->{jPanel3}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)->addContainerGap())->add($self->{jPanel1}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{LEADING})->add($layout->createSequentialGroup()->add($self->{jPanel2}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{UNRELATED})->add($self->{jPanel3}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{PREFERRED_SIZE})->addPreferredGap($org::allbinary::image::gui::org::jdesktop->{layout}->{LayoutStyle}->{RELATED})->add($self->{jPanel1}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::image::gui::org::jdesktop->{layout}->{GroupLayout}->{DEFAULT_SIZE}, 32767)));
}


sub generateJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->process();
}


sub totalAngleJComboBoxActionPerformed {
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


# throws IOException
sub visit {
    my ($self, $generatedBufferedImage, $name, $index) = @_;
        $self->{result} = $generatedBufferedImage;
        $self->getParent()->repaint();
        my $file = $self->{imageProcessorInput}->getFiles()->[$index];
        if (!$self->{writeOverOriginalJCheckBox}->isSelected()) {
            my $filePath = $file->getAbsolutePath();
            my $extensionIndex = index($filePath, $self->{imageStrings}->{PNG_EXTENSION});
            $filePath = 'org::allbinary::logic::string::StringMaker'->new()->append(substr($filePath, 0, ($extensionIndex) - (0)))->append('org::allbinary::string::CommonSeps'->getInstance()->{UNDERSCORE})->append($name)->append($self->{imageStrings}->{PNG_EXTENSION})->toString();
            $file = 'java::io::File'->new($filePath);
        }
        my $isWritten = 'javax::imageio::ImageIO'->write($self->{result}, $self->{imageStrings}->{PNG}, $file);
        $self->{logUtil}->putF("File: " . $file . " Wrote: " . $isWritten, $self, $self->{commonStrings}->{RUN});
}

# use java::awt;
# use java::awt::image::BufferedImage;
# use java::awt::image::RenderedImage;
use java::io::File;
# use java::io::IOException;
# use javax::imageio::ImageIO;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::image::ImageArrayRotationUtil;
use org::allbinary::media::image::ImageProcessedVisitor;
use org::allbinary::media::image::ImageProcessorInput;
use org::allbinary::media::image::ImageStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use java::lang::Thread;

1;

