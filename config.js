// ═══════════════════════════════════════════════════════════════
// 《长城新语》站点配置
// 修改本文件即可更换所有文案与数字人数据，无需改动页面结构。
// ═══════════════════════════════════════════════════════════════

// 站点全局文案
export const SITE_TEXT = {
  // 序章
  title: '长城新语',
  subtitle: '河北长城文化数字交互体验',
  prologueBody:
    '长城不仅是一道跨越山河的建筑遗存，也承载着持续千年的文化记忆。本项目尝试以数字技术重新呈现河北长城的建筑形态，并通过数字人交互，让长城从被观看的文化遗产，转变为可以被聆听、被询问、被交流的文化体验。',
  startBtn: '开始体验',

  // 构境 → 新语 的过渡文案（两行）
  transition: ['砖石构筑长城，', '故事让它继续被讲述。'],

  // 第三阶段：数字人选择页
  part3Title: '选择一位长城讲述者',
  part3Subtitle: '跨越砖石与时间，与河北长城展开一次对话。',
  backBtn: '← 返回长城构境',

  // 数字人体验引导弹窗（{name} 会被替换为当前数字人名字）
  dialogTitle: '开始与{name}对话',
  dialogDesc:
    '接下来你将进入实时数字人对话空间。你可以直接提出与这段长城相关的问题，也可以从下面的问题开始。',
  dialogBack: '返回',
  dialogEnter: '进入实时对话',
};

// 数字人数据（可增删改）
// name / location / role / description / talkBtn 为卡片展示文案
// avatarImage：数字人形象图片地址（相对或绝对 URL），留空则显示默认占位。
// viduUrl：对应的 Vidu 实时数字人分享链接，点击「进入实时对话」后以新标签页打开。
export const DIGITAL_HUMANS = [
  {
    name: '礼礼',
    location: '崇礼长城段',
    role: '崇礼长城守护者',
    description: '我来自燕山深处，带你认识自然山河中的长城故事。',
    talkBtn: '与礼礼对话',
    avatarImage: 'images/1.png',
    viduUrl: 'https://www.vidu.cn/vidu-stream/share-avatar/3463313255508306',
    exampleQuestions: [
      '崇礼长城有什么独特的自然环境特点？',
      '这里的长城建筑和其他地区有什么不同？',
      '崇礼长城有哪些值得了解的历史故事？',
      '来到崇礼长城，最值得关注什么？',
    ],
  },
  {
    name: '峰峰',
    location: '喜峰口长城段',
    role: '喜峰口长城讲述者',
    description: '我守望古老关隘，讲述长城背后的历史记忆。',
    talkBtn: '与峰峰对话',
    avatarImage: 'images/2.png',
    viduUrl: 'https://www.vidu.cn/vidu-stream/share-avatar/3440866191998907',
    exampleQuestions: [
      '喜峰口为什么是长城的重要关隘？',
      '这里发生过哪些重要历史事件？',
      '喜峰口长城有什么建筑特点？',
      '这里体现了怎样的长城精神？',
    ],
  },
  {
    name: '山山',
    location: '山海关长城段',
    role: '山海关历史见证者',
    description: '我见证天下第一关，带你探索山海关长城的历史与建筑智慧。',
    talkBtn: '与山山对话',
    avatarImage: 'images/3.png',
    viduUrl: 'https://www.vidu.cn/vidu-stream/share-avatar/3440748986355535',
    exampleQuestions: [
      '为什么山海关被称为“天下第一关”？',
      '山海关长城有哪些重要建筑？',
      '山海关在中国长城历史中有什么意义？',
      '第一次来到山海关，最值得了解哪些内容？',
    ],
  },
  {
    name: '龙龙',
    location: '老龙头长城段',
    role: '老龙头长城讲述者',
    description: '我守望长城入海处，带你见证巨龙入海的壮阔景象。',
    talkBtn: '与龙龙对话',
    avatarImage: 'images/4.png',
    viduUrl: 'https://www.vidu.cn/vidu-stream/live-pro?avatar_id=3440884070178909&live_id=21480711596012161',
    exampleQuestions: [
      '老龙头为什么被称为“长城入海的地方”？',
      '老龙头长城有哪些独特的建筑？',
      '老龙头在明长城中有着怎样的重要地位？',
      '第一次来到老龙头，最值得了解什么？',
    ],
  },
];
