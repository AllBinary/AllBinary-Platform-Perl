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

package org::allbinary::graphics::j2me::MyFrame;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JFrame','org::allbinary::gui::dialog::FileJDialogListenerInterface','org::allbinary::gui::dialog::HashMapJDialogListenerInterface','java::awt::event::KeyListener';

our $MAXWORKAREAS = 10;
our $numberOfWorkAreas = 0;
our $PATH = "G:/mnt/bc/mydev/work/graphics/AllBinaryGraphicsJavaApplication";
our $SAVE_PATH = $org::allbinary::graphics::j2me::MyFrame::PATH . "/save";
our $TEMPLATE_EXPORT_PATH = $org::allbinary::graphics::j2me::MyFrame::PATH . "/templates/export";
our $statusJLabel = undef;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{guiLog} = 'org::allbinary::logic::communication::log::GuiLog'->getInstance();
    $self->{xslHelper} = 'org::allbinary::data::tree::dom::XslHelper'->getInstance();
    $self->{JAVA_TEMPLATE} = "svgExport.xsl";
    $self->{SAVEEXTENSION} = ".gxml";
    $self->{JAVAEXTENSION} = ".javax";
    $self->{fileJDialog} = undef;
    $self->{rotateJDialog} = undef;
    $self->{animateJButton} = undef;
    $self->{autoDamageJMenuItem} = undef;
    $self->{autoExplodeJMenuItem} = undef;
    $self->{autoGrowJMenuItem} = undef;
    $self->{autoRotateGenerationJMenuItem} = undef;
    $self->{autoSheildMenuItem} = undef;
    $self->{autoShrinkJMenuItem} = undef;
    $self->{centerJMenuItem} = undef;
    $self->{copyJMenuItem1} = undef;
    $self->{exitJMenuItem} = undef;
    $self->{explodeAllJMenuItem} = undef;
    $self->{exportJMenuItem1} = undef;
    $self->{fileJMenu} = undef;
    $self->{frameJMenu} = undef;
    $self->{generateJMenu} = undef;
    $self->{insertAfterJMenuItem} = undef;
    $self->{insertBeforeJMenuItem} = undef;
    $self->{jButton1} = undef;
    $self->{jButton2} = undef;
    $self->{jButton3} = undef;
    $self->{jButton4} = undef;
    $self->{jButton41} = undef;
    $self->{jButton5} = undef;
    $self->{jMenu1} = undef;
    $self->{jMenuItem1} = undef;
    $self->{jPanel1} = undef;
    $self->{jTabbedPane} = undef;
    $self->{jToolBar1} = undef;
    $self->{mainJPanel} = undef;
    $self->{menuJMenuBar} = undef;
    $self->{newJMenuItem} = undef;
    $self->{nextFrameJMenuItem} = undef;
    $self->{objectJMenu} = undef;
    $self->{openJButton} = undef;
    $self->{openJMenuItem} = undef;
    $self->{playJButton} = undef;
    $self->{previousFrameJMenuItem} = undef;
    $self->{removeJMenuItem} = undef;
    $self->{saveAsJMenuItem} = undef;
    $self->{saveJButton} = undef;
    $self->{saveJMenuItem} = undef;
    $self->{statusJPanel} = undef;
    $self->{stopJjButton} = undef;
    $self->{viewJMenu} = undef;
    $self->{zoomInJMenuItem} = undef;
    $self->{zoomOutJMenuItem} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->initComponents();
        $self->setSize('org::allbinary::graphics::j2me::Dimension'->new(550, 400));
        $self->{mainJPanel}->setSize('org::allbinary::graphics::j2me::Dimension'->new(550, 400));
        $self->{jTabbedPane}->setSize('org::allbinary::graphics::j2me::Dimension'->new(550, 400));
        $self->{fileJDialog} = 'org::allbinary::gui::dialog::FileJDialog'->new();
        $self->{fileJDialog}->addFinishedListener($self);
        $self->{rotateJDialog} = 'org::allbinary::graphics::j2me::dialog::RotateJDialog'->new($self, 0);
    return $self;
}


sub initComponents {
    my ($self) = @_;
        $self->{jToolBar1} = 'javax::swing::JToolBar'->new();
        $self->{jButton2} = 'javax::swing::JButton'->new();
        $self->{saveJButton} = 'javax::swing::JButton'->new();
        $self->{jButton1} = 'javax::swing::JButton'->new();
        $self->{openJButton} = 'javax::swing::JButton'->new();
        $self->{jButton3} = 'javax::swing::JButton'->new();
        $self->{jButton4} = 'javax::swing::JButton'->new();
        $self->{jButton41} = 'javax::swing::JButton'->new();
        $self->{jButton5} = 'javax::swing::JButton'->new();
        $self->{animateJButton} = 'javax::swing::JButton'->new();
        $self->{playJButton} = 'javax::swing::JButton'->new();
        $self->{stopJjButton} = 'javax::swing::JButton'->new();
        $self->{jPanel1} = 'javax::swing::JPanel'->new();
        $self->{mainJPanel} = 'javax::swing::JPanel'->new();
        $self->{jTabbedPane} = 'javax::swing::JTabbedPane'->new();
        $self->{statusJPanel} = 'javax::swing::JPanel'->new();
        $org::allbinary::graphics::j2me::MyFrame::statusJLabel = 'javax::swing::JLabel'->new();
        $self->{menuJMenuBar} = 'javax::swing::JMenuBar'->new();
        $self->{fileJMenu} = 'javax::swing::JMenu'->new();
        $self->{newJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{openJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{saveJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{saveAsJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{exportJMenuItem1} = 'javax::swing::JMenuItem'->new();
        $self->{exitJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{viewJMenu} = 'javax::swing::JMenu'->new();
        $self->{zoomInJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{zoomOutJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{objectJMenu} = 'javax::swing::JMenu'->new();
        $self->{explodeAllJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{frameJMenu} = 'javax::swing::JMenu'->new();
        $self->{previousFrameJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{nextFrameJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{removeJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{copyJMenuItem1} = 'javax::swing::JMenuItem'->new();
        $self->{insertAfterJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{insertBeforeJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{generateJMenu} = 'javax::swing::JMenu'->new();
        $self->{centerJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{autoDamageJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{autoExplodeJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{autoGrowJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{jMenuItem1} = 'javax::swing::JMenuItem'->new();
        $self->{autoRotateGenerationJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{autoSheildMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{autoShrinkJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{jMenu1} = 'javax::swing::JMenu'->new();
        $self->addWindowListener(do {
            package java::awt::event::WindowAdapter::AnonymousN69591 { our @ISA = ('java::awt::event::WindowAdapter');
            

            sub windowClosing {
                my ($self, $evt) = @_;
                $self->exitForm($evt);
            }
            }
            'java::awt::event::WindowAdapter::AnonymousN69591'->can('new') ? 'java::awt::event::WindowAdapter::AnonymousN69591'->new() : bless({}, 'java::awt::event::WindowAdapter::AnonymousN69591')
        });
        $self->{jButton2}->setText("New");
        $self->{jButton2}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69778 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->jButton2ActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69778'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69778'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69778')
        });
        $self->{jToolBar1}->add($self->{jButton2});
        $self->{saveJButton}->setText("Save");
        $self->{saveJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70002 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->saveJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70002'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70002'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70002')
        });
        $self->{jToolBar1}->add($self->{saveJButton});
        $self->{jButton1}->setText("Export");
        $self->{jButton1}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70226 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->jButton1ActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70226'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70226'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70226')
        });
        $self->{jToolBar1}->add($self->{jButton1});
        $self->{openJButton}->setText("Open");
        $self->{openJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN70450 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->openJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN70450'->can('new') ? 'java::awt::event::ActionListener::AnonymousN70450'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN70450')
        });
        $self->{jToolBar1}->add($self->{openJButton});
        $self->{jButton3}->setText("Copy");
        $self->{jToolBar1}->add($self->{jButton3});
        $self->{jButton4}->setText("Insert Before");
        $self->{jToolBar1}->add($self->{jButton4});
        $self->{jButton41}->setText("Insert After");
        $self->{jToolBar1}->add($self->{jButton41});
        $self->{jButton5}->setText("Delete");
        $self->{jToolBar1}->add($self->{jButton5});
        $self->{animateJButton}->setText("AnimateEdit");
        $self->{jToolBar1}->add($self->{animateJButton});
        $self->{playJButton}->setText("Play");
        $self->{playJButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN71009 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->playJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN71009'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN71009'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN71009')
        });
        $self->{jToolBar1}->add($self->{playJButton});
        $self->{stopJjButton}->setText("Stop");
        $self->{stopJjButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN71233 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->stopJjButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN71233'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN71233'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN71233')
        });
        $self->{jToolBar1}->add($self->{stopJjButton});
        $self->getContentPane()->add($self->{jToolBar1}, $org::allbinary::graphics::j2me::java::awt->{BorderLayout}->{NORTH});
        $self->{jPanel1}->setLayout('java::awt::GridLayout'->new(1, 0));
        $self->{mainJPanel}->setLayout('java::awt::GridLayout'->new(1, 0));
        $self->{jTabbedPane}->setMinimumSize('java::awt::Dimension'->new(550, 400));
        $self->{jTabbedPane}->addChangeListener(do {
            package javax::swing::event::ChangeListener::AnonymousN71688 { our @ISA = ('javax::swing::event::ChangeListener');
            

            sub stateChanged {
                my ($self, $evt) = @_;
                $self->jTabbedPaneStateChanged($evt);
            }
            }
            'javax::swing::event::ChangeListener::AnonymousN71688'->can('new') ? 'javax::swing::event::ChangeListener::AnonymousN71688'->new() : bless({}, 'javax::swing::event::ChangeListener::AnonymousN71688')
        });
        $self->{mainJPanel}->add($self->{jTabbedPane});
        $self->{jPanel1}->add($self->{mainJPanel});
        $self->getContentPane()->add($self->{jPanel1}, $org::allbinary::graphics::j2me::java::awt->{BorderLayout}->{CENTER});
        $self->{statusJPanel}->setLayout('java::awt::GridLayout'->new(1, 0));
        $org::allbinary::graphics::j2me::MyFrame::statusJLabel->setText("Status Bar");
        $self->{statusJPanel}->add($org::allbinary::graphics::j2me::MyFrame::statusJLabel);
        $self->getContentPane()->add($self->{statusJPanel}, $org::allbinary::graphics::j2me::java::awt->{BorderLayout}->{SOUTH});
        $self->{fileJMenu}->setText("File");
        $self->{fileJMenu}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72223 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->fileJMenuActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72223'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72223'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72223')
        });
        $self->{newJMenuItem}->setText("New");
        $self->{newJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72410 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->newJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72410'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72410'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72410')
        });
        $self->{fileJMenu}->add($self->{newJMenuItem});
        $self->{openJMenuItem}->setText("Open");
        $self->{openJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72634 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->openJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72634'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72634'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72634')
        });
        $self->{fileJMenu}->add($self->{openJMenuItem});
        $self->{saveJMenuItem}->setText("Save");
        $self->{saveJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN72858 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->saveJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN72858'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN72858'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN72858')
        });
        $self->{fileJMenu}->add($self->{saveJMenuItem});
        $self->{saveAsJMenuItem}->setText("SaveAs");
        $self->{fileJMenu}->add($self->{saveAsJMenuItem});
        $self->{exportJMenuItem1}->setText("Export");
        $self->{exportJMenuItem1}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN73149 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->exportJMenuItem1ActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN73149'->can('new') ? 'java::awt::event::ActionListener::AnonymousN73149'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN73149')
        });
        $self->{fileJMenu}->add($self->{exportJMenuItem1});
        $self->{exitJMenuItem}->setText("Exit");
        $self->{exitJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN73373 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->exitJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN73373'->can('new') ? 'java::awt::event::ActionListener::AnonymousN73373'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN73373')
        });
        $self->{fileJMenu}->add($self->{exitJMenuItem});
        $self->{menuJMenuBar}->add($self->{fileJMenu});
        $self->{viewJMenu}->setText("View");
        $self->{zoomInJMenuItem}->setText("Zoom In");
        $self->{zoomInJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN73664 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->zoomInJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN73664'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN73664'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN73664')
        });
        $self->{viewJMenu}->add($self->{zoomInJMenuItem});
        $self->{zoomOutJMenuItem}->setText("Zoom Out");
        $self->{zoomOutJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN73888 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->zoomOutJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN73888'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN73888'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN73888')
        });
        $self->{viewJMenu}->add($self->{zoomOutJMenuItem});
        $self->{menuJMenuBar}->add($self->{viewJMenu});
        $self->{objectJMenu}->setText("Objects");
        $self->{explodeAllJMenuItem}->setText("Explode All");
        $self->{explodeAllJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN74179 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->explodeAllJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN74179'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN74179'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN74179')
        });
        $self->{objectJMenu}->add($self->{explodeAllJMenuItem});
        $self->{menuJMenuBar}->add($self->{objectJMenu});
        $self->{frameJMenu}->setText("Frame");
        $self->{frameJMenu}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN74440 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->frameJMenuActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN74440'->can('new') ? 'java::awt::event::ActionListener::AnonymousN74440'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN74440')
        });
        $self->{previousFrameJMenuItem}->setText("Previous");
        $self->{frameJMenu}->add($self->{previousFrameJMenuItem});
        $self->{nextFrameJMenuItem}->setText('org::allbinary::string::CommonLabels'->getInstance()->{NEXT});
        $self->{frameJMenu}->add($self->{nextFrameJMenuItem});
        $self->{removeJMenuItem}->setText("Remove");
        $self->{frameJMenu}->add($self->{removeJMenuItem});
        $self->{copyJMenuItem1}->setText("Copy");
        $self->{frameJMenu}->add($self->{copyJMenuItem1});
        $self->{insertAfterJMenuItem}->setText("Ins After");
        $self->{frameJMenu}->add($self->{insertAfterJMenuItem});
        $self->{insertBeforeJMenuItem}->setText("Ins Before");
        $self->{frameJMenu}->add($self->{insertBeforeJMenuItem});
        $self->{menuJMenuBar}->add($self->{frameJMenu});
        $self->{generateJMenu}->setText("Generate");
        $self->{centerJMenuItem}->setText("Center");
        $self->{centerJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN75116 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->centerJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN75116'->can('new') ? 'java::awt::event::ActionListener::AnonymousN75116'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN75116')
        });
        $self->{generateJMenu}->add($self->{centerJMenuItem});
        $self->{autoDamageJMenuItem}->setText("Damage");
        $self->{generateJMenu}->add($self->{autoDamageJMenuItem});
        $self->{autoExplodeJMenuItem}->setText("Explode");
        $self->{autoExplodeJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN75407 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->autoExplodeJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN75407'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN75407'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN75407')
        });
        $self->{generateJMenu}->add($self->{autoExplodeJMenuItem});
        $self->{autoGrowJMenuItem}->setText("Grow");
        $self->{generateJMenu}->add($self->{autoGrowJMenuItem});
        $self->{jMenuItem1}->setText("Mirror");
        $self->{jMenuItem1}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN75698 { our @ISA = ('java::awt::event::ActionListener');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->jMenuItem1ActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN75698'->can('new') ? 'java::awt::event::ActionListener::AnonymousN75698'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN75698')
        });
        $self->{generateJMenu}->add($self->{jMenuItem1});
        $self->{autoRotateGenerationJMenuItem}->setText("Rotate");
        $self->{autoRotateGenerationJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN75922 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->autoRotateGenerationJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN75922'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN75922'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN75922')
        });
        $self->{generateJMenu}->add($self->{autoRotateGenerationJMenuItem});
        $self->{autoSheildMenuItem}->setText("Shield");
        $self->{generateJMenu}->add($self->{autoSheildMenuItem});
        $self->{autoShrinkJMenuItem}->setText("Shrink");
        $self->{generateJMenu}->add($self->{autoShrinkJMenuItem});
        $self->{menuJMenuBar}->add($self->{generateJMenu});
        $self->{jMenu1}->setText("Help");
        $self->{menuJMenuBar}->add($self->{jMenu1});
        $self->setJMenuBar($self->{menuJMenuBar});
        $self->pack();
}


sub explodeAllJMenuItemMousePressed {
    my ($self, $evt) = @_;
        try {
            'org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService'->fire('org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEvent'->new('org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventSource'->new($org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::EXPLODE, undef)));
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "explodeAllJMenuItemMousePressed", $e);
        }
}


sub autoExplodeJMenuItemMousePressed {
    my ($self, $evt) = @_;
        try {
            'org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService'->fire('org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEvent'->new('org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventSource'->new($org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::AUTOEXPLODE, undef)));
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "autoExplodeJMenuItemMousePressed", $e);
        }
}


sub stopJjButtonMousePressed {
    my ($self, $evt) = @_;
        $self->getSelectedWorkArea()->stop();
}


sub playJButtonMousePressed {
    my ($self, $evt) = @_;
        $self->getSelectedWorkArea()->play();
}


sub autoRotateGenerationJMenuItemMousePressed {
    my ($self, $evt) = @_;
        $self->{rotateJDialog}->setVisible(1);
}


sub zoomOutJMenuItemMousePressed {
    my ($self, $evt) = @_;
        $self->getSelectedWorkArea()->changeZoom(-1);
}


sub zoomInJMenuItemMousePressed {
    my ($self, $evt) = @_;
        $self->getSelectedWorkArea()->changeZoom(1);
}


sub openJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        $self->openGraphics();
}


sub exportJMenuItem1ActionPerformed {
    my ($self, $evt) = @_;
        $self->export();
}


sub saveJMenuItemMousePressed {
    my ($self, $evt) = @_;
        $self->save();
}


sub jTabbedPaneStateChanged {
    my ($self, $evt) = @_;
        $self->updateSelectedWorkArea();
}


sub frameJMenuActionPerformed {
    my ($self, $evt) = @_;
}


sub exitJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        exit(0);
}


sub newJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        $self->newGraphics();
}


sub fileJMenuActionPerformed {
    my ($self, $evt) = @_;
}


sub exitForm {
    my ($self, $evt) = @_;
        exit(0);
}


sub openJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->openGraphics();
}


sub jButton2ActionPerformed {
    my ($self, $evt) = @_;
        $self->newGraphics();
}


sub centerJMenuItemActionPerformed {
    my ($self, $evt) = @_;
        try {
            'org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService'->fire('org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEvent'->new('org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventSource'->new($org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::CENTER, undef)));
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "centerJMenuItemActionPerformed", $e);
        }
}


sub saveJButtonActionPerformed {
    my ($self, $evt) = @_;
        $self->save();
}


sub jButton1ActionPerformed {
    my ($self, $evt) = @_;
        $self->export();
}


sub jMenuItem1ActionPerformed {
    my ($self, $evt) = @_;
        try {
            $self->getSelectedWorkArea()->autoMirror();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "centerJMenuItemActionPerformed", $e);
        }
}


sub onFiles {
    my ($self, $files) = @_;
        try {
            $self->{logUtil}->putF("Reading: " . $files, $self, "onFiles");
            for (my $index = 0; $index < scalar(@{$files}); $index++) {
                my $document = 'org::allbinary::dom::DomHelper'->getInstance()->createDocument($files->[$index]);
                my $workAreaJPanel = 'org::allbinary::graphics::j2me::workarea::WorkAreaJPanel'->new('org::allbinary::graphics::j2me::workarea::WorkAreaDom'->new($document), $self->getSize());
                $workAreaJPanel->setLayout('org::allbinary::graphics::j2me::GridLayout'->new(1, 1));
                $self->add($workAreaJPanel);
            }
            $self->{fileJDialog}->setVisible(0);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "onFiles", $e);
        }
}


sub newGraphics {
    my ($self) = @_;
        try {
            my $newName = "graphic" . $org::allbinary::graphics::j2me::MyFrame::numberOfWorkAreas;
            my $dim = $self->getSize();
            my $newDialog = 'org::allbinary::graphics::j2me::dialog::NewWorkAreaJDialog'->new($self, 0, $dim, $newName);
        } catch ($e) {
            if ('org::allbinary::log::LOGGING'->contains($org::allbinary::log::LOGGING::MENUEVENT)) {
                $self->{guiLog}->put($self->{commonStrings}->{EXCEPTION}, $self, "newJMenuItemActionPerformed", $e);
            }
        }
}


sub openGraphics {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF("Starting", $self, "openImageJMenuItemActionPerformed");
            $self->{fileJDialog}->setVisible(1);
        } catch ($e) {
            if ('org::allbinary::log::LOGGING'->contains($org::allbinary::log::LOGGING::MENUEVENT)) {
                $self->{guiLog}->put($self->{commonStrings}->{EXCEPTION}, $self, "open", $e);
            }
        }
}


sub export {
    my ($self) = @_;
        try {
            my $workAreaJPanel = $self->{jTabbedPane}->getSelectedComponent();
            my $file = 'java::io::File'->new($SAVE_PATH . "/" . $workAreaJPanel->getName() . $self->{JAVAEXTENSION});
            my $document = $workAreaJPanel->toDocument();
            $self->{logUtil}->putF("Export: " . 'org::allbinary::dom::DomHelper'->getInstance()->toString($document), $self, "exportJMenuItem1ActionPerformed");
            $self->{xslHelper}->export($file, $org::allbinary::graphics::j2me::MyFrame::TEMPLATE_EXPORT_PATH . "/" . $self->{JAVA_TEMPLATE}, $document);
        } catch ($e) {
            if ('org::allbinary::log::LOGGING'->contains($org::allbinary::log::LOGGING::MENUEVENT)) {
                $self->{guiLog}->put($self->{commonStrings}->{EXCEPTION}, $self, "export", $e);
            }
        }
}


sub save {
    my ($self) = @_;
        try {
            my $workAreaJPanel = $self->{jTabbedPane}->getSelectedComponent();
            'org::allbinary::dom::DomHelper'->getInstance()->save('java::io::File'->new($SAVE_PATH . "/" . $workAreaJPanel->getName() . $self->{SAVEEXTENSION}), $workAreaJPanel->toDocument());
        } catch ($e) {
            if ('org::allbinary::log::LOGGING'->contains($org::allbinary::log::LOGGING::MENUEVENT)) {
                $self->{guiLog}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{SAVE}, $e);
            }
        }
}


# throws Exception
sub onHashMap {
    my ($self, $hashMap) = @_;
        my $angleIncrementInteger = $hashMap->get(("" . (0)));
        my $totalRotationInteger = $hashMap->get(("" . (1)));
        $self->getSelectedWorkArea()->autoRotate(int($angleIncrementInteger), int($totalRotationInteger));
}


sub getSelectedWorkArea {
    my ($self) = @_;
        return $self->{jTabbedPane}->getSelectedComponent();
}


sub updateSelectedWorkArea {
    my ($self) = @_;
        my $numberOfTabs = $self->{jTabbedPane}->getTabCount();
        for (my $index = 0; $index < $numberOfTabs; $index++) {
            my $workAreaJPanel = $self->{jTabbedPane}->getComponentAt($index);
            $workAreaJPanel->deselect();
        }
        my $workAreaJPanel = $self->{jTabbedPane}->getSelectedComponent();
        if (defined($workAreaJPanel)) {
            $workAreaJPanel->select();
        }
}


# throws Exception
sub add {
    my ($self, $newCanvasInterface) = @_;
        try {
            $numberOfWorkAreas++;
            if ($numberOfWorkAreas == $org::allbinary::graphics::j2me::MyFrame::MAXWORKAREAS) {
                die ("Exception");
            }
            $self->{jTabbedPane}->addTab($newCanvasInterface->getName(), $newCanvasInterface);
            $self->{jTabbedPane}->setSelectedComponent($newCanvasInterface);
            my $animationThread = 'java::lang::Thread'->new($newCanvasInterface);
            $animationThread->start();
            $self->updateSelectedWorkArea();
        } catch ($e) {
            if ('org::allbinary::log::LOGGING'->contains($org::allbinary::log::LOGGING::GRAPHICSCREATION)) {
                $self->{guiLog}->put($self->{commonStrings}->{EXCEPTION}, $self, "addNewCanvas", $e);
            }
        }
}


sub keyPressed {
    my ($self, $keyEvent) = @_;
        $self->getSelectedWorkArea()->keyPressed($keyEvent);
}


sub keyReleased {
    my ($self, $keyEvent) = @_;
}


sub keyTyped {
    my ($self, $keyEvent) = @_;
}


sub main {
    my ($class, $args) = @_;
        try {
            'org::allbinary::math::AngleFactory'->getInstance();
            'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->init();
            'org::allbinary::graphics::j2me::MyFrame'->new()->show();
        } catch ($e) {
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            $logUtil->put('org::allbinary::string::CommonStrings'->getInstance()->{EXCEPTION}, undef, "main", $e);
        }
}

# use java::awt;
use java::io::File;
use java::util::HashMap;
# use javax::swing;
use org::allbinary::data::tree::dom::XslHelper;
use org::allbinary::dom::DomHelper;
use org::allbinary::graphics::j2me::dialog::NewWorkAreaJDialog;
use org::allbinary::graphics::j2me::dialog::RotateJDialog;
use org::allbinary::graphics::j2me::workarea::WorkAreaDom;
use org::allbinary::graphics::j2me::workarea::WorkAreaJPanel;
use org::allbinary::graphics::j2me::workarea::WorkAreaJPanelInterface;
use org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEvent;
use org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService;
use org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventSource;
use org::allbinary::gui::dialog::FileJDialog;
use org::allbinary::gui::dialog::FileJDialogListenerInterface;
use org::allbinary::gui::dialog::HashMapJDialogListenerInterface;
use org::allbinary::log::LOGGING;
use org::allbinary::logic::communication::log::GuiLog;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::math::AngleFactory;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::allbinary::graphics::j2me::Dimension;
use java::lang::System;
use org::allbinary::graphics::j2me::GridLayout;
use java::lang::Thread;

1;

