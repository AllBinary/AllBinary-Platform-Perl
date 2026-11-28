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
use parent -norequire,'java::lang::Object','org::allbinary::gui::dialog::FileJDialogListenerInterface','org::allbinary::gui::dialog::HashMapJDialogListenerInterface';

our $MAXWORKAREAS = 10;
our $numberOfWorkAreas = 0;
our $PATH = "G:/mnt/bc/mydev/work/graphics/AllBinaryGraphicsJavaApplication";
tie our $SAVE_PATH, 'java::lang::LazyStatic', sub { $org::allbinary::graphics::j2me::MyFrame::PATH . "/save" };
tie our $TEMPLATE_EXPORT_PATH, 'java::lang::LazyStatic', sub { $org::allbinary::graphics::j2me::MyFrame::PATH . "/templates/export" };
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
    $self->{fileJDialog} = undef unless exists $self->{fileJDialog};
    $self->{rotateJDialog} = undef unless exists $self->{rotateJDialog};
    $self->{animateJButton} = undef unless exists $self->{animateJButton};
    $self->{autoDamageJMenuItem} = undef unless exists $self->{autoDamageJMenuItem};
    $self->{autoExplodeJMenuItem} = undef unless exists $self->{autoExplodeJMenuItem};
    $self->{autoGrowJMenuItem} = undef unless exists $self->{autoGrowJMenuItem};
    $self->{autoRotateGenerationJMenuItem} = undef unless exists $self->{autoRotateGenerationJMenuItem};
    $self->{autoSheildMenuItem} = undef unless exists $self->{autoSheildMenuItem};
    $self->{autoShrinkJMenuItem} = undef unless exists $self->{autoShrinkJMenuItem};
    $self->{centerJMenuItem} = undef unless exists $self->{centerJMenuItem};
    $self->{copyJMenuItem1} = undef unless exists $self->{copyJMenuItem1};
    $self->{exitJMenuItem} = undef unless exists $self->{exitJMenuItem};
    $self->{explodeAllJMenuItem} = undef unless exists $self->{explodeAllJMenuItem};
    $self->{exportJMenuItem1} = undef unless exists $self->{exportJMenuItem1};
    $self->{fileJMenu} = undef unless exists $self->{fileJMenu};
    $self->{frameJMenu} = undef unless exists $self->{frameJMenu};
    $self->{generateJMenu} = undef unless exists $self->{generateJMenu};
    $self->{insertAfterJMenuItem} = undef unless exists $self->{insertAfterJMenuItem};
    $self->{insertBeforeJMenuItem} = undef unless exists $self->{insertBeforeJMenuItem};
    $self->{jButton1} = undef unless exists $self->{jButton1};
    $self->{jButton2} = undef unless exists $self->{jButton2};
    $self->{jButton3} = undef unless exists $self->{jButton3};
    $self->{jButton4} = undef unless exists $self->{jButton4};
    $self->{jButton41} = undef unless exists $self->{jButton41};
    $self->{jButton5} = undef unless exists $self->{jButton5};
    $self->{jMenu1} = undef unless exists $self->{jMenu1};
    $self->{jMenuItem1} = undef unless exists $self->{jMenuItem1};
    $self->{jPanel1} = undef unless exists $self->{jPanel1};
    $self->{jTabbedPane} = undef unless exists $self->{jTabbedPane};
    $self->{jToolBar1} = undef unless exists $self->{jToolBar1};
    $self->{mainJPanel} = undef unless exists $self->{mainJPanel};
    $self->{menuJMenuBar} = undef unless exists $self->{menuJMenuBar};
    $self->{newJMenuItem} = undef unless exists $self->{newJMenuItem};
    $self->{nextFrameJMenuItem} = undef unless exists $self->{nextFrameJMenuItem};
    $self->{objectJMenu} = undef unless exists $self->{objectJMenu};
    $self->{openJButton} = undef unless exists $self->{openJButton};
    $self->{openJMenuItem} = undef unless exists $self->{openJMenuItem};
    $self->{playJButton} = undef unless exists $self->{playJButton};
    $self->{previousFrameJMenuItem} = undef unless exists $self->{previousFrameJMenuItem};
    $self->{removeJMenuItem} = undef unless exists $self->{removeJMenuItem};
    $self->{saveAsJMenuItem} = undef unless exists $self->{saveAsJMenuItem};
    $self->{saveJButton} = undef unless exists $self->{saveJButton};
    $self->{saveJMenuItem} = undef unless exists $self->{saveJMenuItem};
    $self->{statusJPanel} = undef unless exists $self->{statusJPanel};
    $self->{stopJjButton} = undef unless exists $self->{stopJjButton};
    $self->{viewJMenu} = undef unless exists $self->{viewJMenu};
    $self->{zoomInJMenuItem} = undef unless exists $self->{zoomInJMenuItem};
    $self->{zoomOutJMenuItem} = undef unless exists $self->{zoomOutJMenuItem};
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->initComponents();
        $self->setSize('java::awt::Dimension'->new(550, 400));
        $self->{mainJPanel}->setSize('java::awt::Dimension'->new(550, 400));
        $self->{jTabbedPane}->setSize('java::awt::Dimension'->new(550, 400));
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
            package java::awt::event::WindowAdapter::AnonymousN69289 { our @ISA = ('java::awt::event::WindowAdapter', 'java::lang::Object');
            

            sub windowClosing {
                my ($self, $evt) = @_;
                $self->exitForm($evt);
            }
            }
            'java::awt::event::WindowAdapter::AnonymousN69289'->can('new') ? 'java::awt::event::WindowAdapter::AnonymousN69289'->new() : bless({}, 'java::awt::event::WindowAdapter::AnonymousN69289')
        });
        $self->{jButton2}->setText("New");
        $self->{jButton2}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69428 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->jButton2ActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69428'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69428'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69428')
        });
        $self->{jToolBar1}->add($self->{jButton2});
        $self->{saveJButton}->setText("Save");
        $self->{saveJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69604 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->saveJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69604'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69604'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69604')
        });
        $self->{jToolBar1}->add($self->{saveJButton});
        $self->{jButton1}->setText("Export");
        $self->{jButton1}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69780 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->jButton1ActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69780'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69780'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69780')
        });
        $self->{jToolBar1}->add($self->{jButton1});
        $self->{openJButton}->setText("Open");
        $self->{openJButton}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN69956 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->openJButtonActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN69956'->can('new') ? 'java::awt::event::ActionListener::AnonymousN69956'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN69956')
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
            package java::awt::event::MouseAdapter::AnonymousN70467 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->playJButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN70467'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN70467'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN70467')
        });
        $self->{jToolBar1}->add($self->{playJButton});
        $self->{stopJjButton}->setText("Stop");
        $self->{stopJjButton}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN70643 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->stopJjButtonMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN70643'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN70643'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN70643')
        });
        $self->{jToolBar1}->add($self->{stopJjButton});
        $self->getContentPane()->add($self->{jToolBar1}, $java::awt::BorderLayout::NORTH);
        $self->{jPanel1}->setLayout('java::awt::GridLayout'->new(1, 0));
        $self->{mainJPanel}->setLayout('java::awt::GridLayout'->new(1, 0));
        $self->{jTabbedPane}->setMinimumSize('java::awt::Dimension'->new(550, 400));
        $self->{jTabbedPane}->addChangeListener(do {
            package javax::swing::event::ChangeListener::AnonymousN70986 { our @ISA = ('javax::swing::event::ChangeListener', 'java::lang::Object');
            

            sub stateChanged {
                my ($self, $evt) = @_;
                $self->jTabbedPaneStateChanged($evt);
            }
            }
            'javax::swing::event::ChangeListener::AnonymousN70986'->can('new') ? 'javax::swing::event::ChangeListener::AnonymousN70986'->new() : bless({}, 'javax::swing::event::ChangeListener::AnonymousN70986')
        });
        $self->{mainJPanel}->add($self->{jTabbedPane});
        $self->{jPanel1}->add($self->{mainJPanel});
        $self->getContentPane()->add($self->{jPanel1}, $java::awt::BorderLayout::CENTER);
        $self->{statusJPanel}->setLayout('java::awt::GridLayout'->new(1, 0));
        $org::allbinary::graphics::j2me::MyFrame::statusJLabel->setText("Status Bar");
        $self->{statusJPanel}->add($org::allbinary::graphics::j2me::MyFrame::statusJLabel);
        $self->getContentPane()->add($self->{statusJPanel}, $java::awt::BorderLayout::SOUTH);
        $self->{fileJMenu}->setText("File");
        $self->{fileJMenu}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71425 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->fileJMenuActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71425'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71425'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71425')
        });
        $self->{newJMenuItem}->setText("New");
        $self->{newJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71564 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->newJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71564'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71564'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71564')
        });
        $self->{fileJMenu}->add($self->{newJMenuItem});
        $self->{openJMenuItem}->setText("Open");
        $self->{openJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN71740 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->openJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN71740'->can('new') ? 'java::awt::event::ActionListener::AnonymousN71740'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN71740')
        });
        $self->{fileJMenu}->add($self->{openJMenuItem});
        $self->{saveJMenuItem}->setText("Save");
        $self->{saveJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN71916 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->saveJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN71916'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN71916'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN71916')
        });
        $self->{fileJMenu}->add($self->{saveJMenuItem});
        $self->{saveAsJMenuItem}->setText("SaveAs");
        $self->{fileJMenu}->add($self->{saveAsJMenuItem});
        $self->{exportJMenuItem1}->setText("Export");
        $self->{exportJMenuItem1}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72159 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->exportJMenuItem1ActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72159'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72159'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72159')
        });
        $self->{fileJMenu}->add($self->{exportJMenuItem1});
        $self->{exitJMenuItem}->setText("Exit");
        $self->{exitJMenuItem}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN72335 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->exitJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN72335'->can('new') ? 'java::awt::event::ActionListener::AnonymousN72335'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN72335')
        });
        $self->{fileJMenu}->add($self->{exitJMenuItem});
        $self->{menuJMenuBar}->add($self->{fileJMenu});
        $self->{viewJMenu}->setText("View");
        $self->{zoomInJMenuItem}->setText("Zoom In");
        $self->{zoomInJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN72578 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->zoomInJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN72578'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN72578'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN72578')
        });
        $self->{viewJMenu}->add($self->{zoomInJMenuItem});
        $self->{zoomOutJMenuItem}->setText("Zoom Out");
        $self->{zoomOutJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN72754 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->zoomOutJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN72754'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN72754'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN72754')
        });
        $self->{viewJMenu}->add($self->{zoomOutJMenuItem});
        $self->{menuJMenuBar}->add($self->{viewJMenu});
        $self->{objectJMenu}->setText("Objects");
        $self->{explodeAllJMenuItem}->setText("Explode All");
        $self->{explodeAllJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN72997 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->explodeAllJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN72997'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN72997'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN72997')
        });
        $self->{objectJMenu}->add($self->{explodeAllJMenuItem});
        $self->{menuJMenuBar}->add($self->{objectJMenu});
        $self->{frameJMenu}->setText("Frame");
        $self->{frameJMenu}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN73210 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->frameJMenuActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN73210'->can('new') ? 'java::awt::event::ActionListener::AnonymousN73210'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN73210')
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
            package java::awt::event::ActionListener::AnonymousN73838 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->centerJMenuItemActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN73838'->can('new') ? 'java::awt::event::ActionListener::AnonymousN73838'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN73838')
        });
        $self->{generateJMenu}->add($self->{centerJMenuItem});
        $self->{autoDamageJMenuItem}->setText("Damage");
        $self->{generateJMenu}->add($self->{autoDamageJMenuItem});
        $self->{autoExplodeJMenuItem}->setText("Explode");
        $self->{autoExplodeJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN74081 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->autoExplodeJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN74081'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN74081'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN74081')
        });
        $self->{generateJMenu}->add($self->{autoExplodeJMenuItem});
        $self->{autoGrowJMenuItem}->setText("Grow");
        $self->{generateJMenu}->add($self->{autoGrowJMenuItem});
        $self->{jMenuItem1}->setText("Mirror");
        $self->{jMenuItem1}->addActionListener(do {
            package java::awt::event::ActionListener::AnonymousN74324 { our @ISA = ('java::awt::event::ActionListener', 'java::lang::Object');
            

            sub actionPerformed {
                my ($self, $evt) = @_;
                $self->jMenuItem1ActionPerformed($evt);
            }
            }
            'java::awt::event::ActionListener::AnonymousN74324'->can('new') ? 'java::awt::event::ActionListener::AnonymousN74324'->new() : bless({}, 'java::awt::event::ActionListener::AnonymousN74324')
        });
        $self->{generateJMenu}->add($self->{jMenuItem1});
        $self->{autoRotateGenerationJMenuItem}->setText("Rotate");
        $self->{autoRotateGenerationJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN74500 { our @ISA = ('java::awt::event::MouseAdapter', 'java::lang::Object');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->autoRotateGenerationJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN74500'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN74500'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN74500')
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
                $workAreaJPanel->setLayout('java::awt::GridLayout'->new(1, 1));
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

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::awt ();
use java::io::File ();
use java::util::HashMap ();
# use javax::swing ();
use org::allbinary::data::tree::dom::XslHelper ();
use org::allbinary::dom::DomHelper ();
use org::allbinary::graphics::j2me::dialog::NewWorkAreaJDialog ();
use org::allbinary::graphics::j2me::dialog::RotateJDialog ();
use org::allbinary::graphics::j2me::workarea::WorkAreaDom ();
use org::allbinary::graphics::j2me::workarea::WorkAreaJPanel ();
use org::allbinary::graphics::j2me::workarea::WorkAreaJPanelInterface ();
use org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEvent ();
use org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService ();
use org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventSource ();
use org::allbinary::gui::dialog::FileJDialog ();
use org::allbinary::gui::dialog::FileJDialogListenerInterface ();
use org::allbinary::gui::dialog::HashMapJDialogListenerInterface ();
use org::allbinary::log::LOGGING ();
use org::allbinary::logic::communication::log::GuiLog ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::math::SmallIntegerSingletonFactory ();
use org::allbinary::math::AngleFactory ();
use org::allbinary::string::CommonLabels ();
use org::allbinary::string::CommonStrings ();
use org::w3c::dom::Document ();
# use java::awt::BorderLayout ();
# use java::awt::Dimension ();
# use java::awt::GridLayout ();
# use java::awt::event::ActionEvent ();
# use java::awt::event::ActionListener ();
# use java::awt::event::KeyEvent ();
# use java::awt::event::KeyListener ();
# use java::awt::event::MouseAdapter ();
# use java::awt::event::MouseEvent ();
# use java::awt::event::WindowAdapter ();
# use java::awt::event::WindowEvent ();
# use javax::swing::JButton ();
# use javax::swing::JFrame ();
# use javax::swing::JLabel ();
# use javax::swing::JMenu ();
# use javax::swing::JMenuBar ();
# use javax::swing::JMenuItem ();
# use javax::swing::JPanel ();
# use javax::swing::JTabbedPane ();
# use javax::swing::JToolBar ();
# use javax::swing::event::ChangeEvent ();
# use javax::swing::event::ChangeListener ();
use java::lang::System ();
use java::lang::Thread ();

1;

