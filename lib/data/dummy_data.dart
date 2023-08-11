import 'dart:developer';

import 'package:business_bridge/models/assign_page_projects.dart';
import 'package:business_bridge/models/assign_project_details.dart';
import 'package:business_bridge/models/business_category.dart';
import 'package:business_bridge/models/case_study.dart';
import 'package:business_bridge/models/knowmore.dart';
import 'package:flutter/material.dart';
import 'package:business_bridge/models/services.dart';

const dummyCase = [
  case_Study(
    id: 'c1',
    title: 'TELBOT TRUCKS LTD.',
    imageUrl: 'assets/images/case_study/case_transport.jpg',
    ClientGoal: [
      'Our client is Talbot Trucks. Talbot Trucks has approached McKinsey for help in assessing the feasibility of manufacturing electric trucks to reduce its fleet’s carbon footprint.'
    ],
    Situation: [
      'Talbot Trucks is a Europe-based private truck OEM. It produces and sells trucks all over the world. Talbot Trucks is considered a leader in quality manufacturing. Its primary customer base includes large trucking companies that own thousands of trucks and owner-operators, which are smaller customers that own fewer trucks.'
          '\n\nTrucks today are mainly powered by diesel engines and require carbon-based petroleum fuel. Talbot Trucks is interested in exploring ways to reduce the carbon footprint of its vehicles and has specifically asked about electric trucks, or “eTrucks.”'
          '\n\nETrucks and diesel trucks differ in the design—e-motor and batteries versus combustion engines—and also in the way they are fueled, meaning comparably slow charging versus quick refilling with diesel fuel at gas stations. The introduction of this new technology is disruptive for the manufacturers as well as customers both large and small.'
    ],
    Study: [
      'The CEO of Talbot Trucks has approached McKinsey to help determine the attractiveness of an investment in eTruck manufacturing for its European market. '
    ],
  ),
  case_Study(
    id: 'c2',
    title: 'BEAUTIFY LTD.',
    imageUrl: 'assets/images/case_study/case_beautify.jpg',
    ClientGoal: [
      'Our client is Beautify. Beautify has approached McKinsey for help with exploring new ways to approach its customers.'
    ],
    Situation: [
      'Beautify is a global prestige cosmetics company that sells its products mainly inside high-end department stores such as Harrods and Shanghai No. 1. It also has a presence online with specialty retailers like Sephora. Beautify produces a number of makeup, fragrance, and skincare products sold under several different brands.',
      'In department stores, beauty consultants play a critical role with consumers: \n - approaching “passive” customers \n - demonstrating their knowledge of the products \n - actively selling the products \n - maintaining a loyal customer base of repeat \n    buyers',
      'These consultants are hired directly by Beautify or through specialist, third-party agencies that find new recruits for a fee. Beautify is then responsible for selecting, training, and paying the consultants. Within Beautify, beauty consultants are managed independently by each brand in each country. For example, this may mean a consultant might be part of the Chanel team in a store. However, consumers are shifting more to online shopping, and too many beauty consultants are left working in empty department stores',
    ],
    Study: [
      'Beautify’s president and COO engaged McKinsey to help evaluate if training the majority of beauty consultants to use virtual channels to connect with customers could be profitable for the company.'
    ],
  ),
  case_Study(
    id: 'c3',
    title: 'GLOBAL PHARMA LTD.',
    imageUrl: 'assets/images/case_study/case_pharm.jpg',
    ClientGoal: [
      'Our client is GlobaPharm, a major pharmaceutical company (pharmaco) with \$10 billion a year in revenue. Its corporate headquarters and primary research and development (R&D) centers are in Germany, with regional sales offices worldwide.'
    ],
    Situation: [
      'GlobaPharm has a long, successful tradition in researching, developing, and selling “small molecule” drugs. This class of drugs represents the vast majority of drugs today, including aspirin and most blood-pressure or cholesterol medications. GlobaPharm is interested in entering a new, rapidly growing segment of drugs called “biologicals.” These are often proteins or other large, complex molecules that can treat conditions not addressable by traditional drugs.',
      'R&D for biologicals is vastly different from small-molecule R&D. To gain these capabilities, pharmacos have three options: they can build them from scratch, partner with existing start-ups, or acquire the start-ups. Since its competitors are already several years ahead of GlobaPharm, GlobaPharm wants to jumpstart its biologicals program by acquiring BioFuture, a leading biologicals start-up based in the San Francisco area. BioFuture was founded 12 years ago by several prominent scientists and now employs 200 people. It is publicly traded and at its current share price the company is worth about \$1 billion in total.',
    ],
    Study: [
      'GlobaPharm has engaged McKinsey to evaluate the BioFuture acquisition and to advise on its strategic fit with GlobaPharm\'s biologicals strategy. Our overall question today, therefore, is “Should GlobaPharm acquire BioFuture?”'
    ],
  ),
  case_Study(
    id: 'c4',
    title: 'BILL & MELINDA GATES FOUNDATION',
    imageUrl: 'assets/images/case_study/case_private_foundation.jpg',
    ClientGoal: [
      'The Bill & Melinda Gates Foundation is a private organization with vast ambitions; one of its goals is to reduce extreme poverty worldwide. The foundation has asked McKinsey to design a basic financial-services offering for residents in remote communities in Mexico.'
    ],
    Situation: [
      'The majority of Mexico’s rural population is relatively poor, relying in part on government benefits for their livelihood. Since they tend not to have bank accounts, they usually collect those benefits in cash from a limited number of state-owned bank branches. These branches are often a long way from where the recipients live, so it can take a lot of time and effort to collect benefits. In addition, while traveling to the branches, people can be at risk of falling victim to crime.',
      'The Mexican government also owns and operates a chain of 22,000 stores throughout Mexico, called Diconsa, which provide basic food, clothes, and other essential goods to rural populations. These stores are supplied through a network of central and regional warehouses and several thousand delivery trucks.',
    ],
    Study: [
      'McKinsey has been asked to investigate and assess the possibility of using the Diconsa network to provide a set of basic financial services to supplement the limited number of state-owned bank branches. This would start with dispensing benefit payments and would gradually grow to include savings accounts, bill payments, insurance, loans, and other financial products.',
    ],
  ),
  case_Study(
    id: 'c5',
    title: 'SHOPS CORP.',
    imageUrl: 'assets/images/case_study/case_sales.jpg',
    ClientGoal: [
      'Our client is Shops Corporation. Shops Corporation approached McKinsey for help to improve diversity, equity, and inclusion within their company.'
    ],
    Situation: [
      'Shops Corporation is a US-based retail company that is committed to ensuring that its own employees—especially those at their corporate headquarters—represent its customers. The majority of Shops Corporation’s customers are women, while only about a quarter of their executive team is women. The CEO has shared the following with your team.',
      'Companies in the top-quartile for gender diversity on executive teams are more likely to outperform on profitability.',
      'Companies in the top-quartile for ethnic/cultural diversity on executive teams are more likely to have industry-leading profitability.',
      'For these and other reasons, Shops Corporation would like to improve diversity, equity, and inclusion throughout their organization. In particular, they are dedicated to enhancing the representation of women and other minority employees within senior leadership.',
    ],
    Study: [
      'Shops Corporation has recently created full-time, director-level roles to lead a number of inclusive affinity groups and has engaged McKinsey to help Shops Corporation with their diversity and inclusion goals.',
    ],
  ),
  case_Study(
    id: 'c6',
    title: 'SUPER SODA LTD.',
    imageUrl: 'assets/images/case_study/case_supersoda.jpg',
    ClientGoal: [
      'Our client is SuperSoda, a top-three beverage producer in the United States that has approached McKinsey for help designing its product launch strategy.'
    ],
    Situation: [
      'As an integrated beverage company, SuperSoda leads its own brand design, marketing, and sales efforts. The company also owns its entire beverage supply chain, including production of concentrates, bottling and packaging, and distribution to retail outlets. SuperSoda has a considerable number of brands across carbonated and noncarbonated drinks, five large bottling plants throughout the country, and distribution agreements with most major retailers.',
      'SuperSoda is evaluating the launch of a new product, a flavored sports drink called “Electro-Light.” Sports drinks are usually designed to replenish energy, with sugars, and electrolytes, or salts, in the body. However, Electro-Light has been formulated to focus more on the replenishment of electrolytes and has a lower sugar content compared to most other sports drinks. The company expects this new beverage to capitalize on the recent trend away from high-sugar products.',
    ],
    Study: [
      'SuperSoda’s vice president of marketing has asked McKinsey to help analyze key factors surrounding the launch of Electro-Light and its own internal capabilities to support that effort.',
    ],
  ),
  case_Study(
    id: 'c7',
    title: 'LORAVIA GOVT. PROJECT',
    imageUrl: 'assets/images/case_study/case_goverment.jpg',
    ClientGoal: [
      'Loravia is a fictional country located in Eastern Europe with a population of 20 million. The government of Loravia wants to make major improvements in both the quantity and quality of education for its children. Because McKinsey has a great deal of global knowledge and expertise in the education sector, the Loravian department of education has asked McKinsey to advise on how it can achieve this transformation of its school system.'
    ],
    Situation: [
      'Loravia’s free market economy is still developing, having emerged from many decades under communism. Recently, the government of Loravia put a new economic plan in place with aspirations to transform its economy and turbocharge its development so it’s well positioned to compete with its European neighbors. The government of Loravia realizes that the education of its children is a critical factor in meeting crucial economic development goals. It intends to transform the school system over the next ten years to enable it to support its economic aspirations. Schooling in Loravia is completely public and is provided by a network of government-run schools that admit children from ages five through 18.',
    ],
    Study: [
      'McKinsey has been asked to support the Loravian department of education in diagnosing the state of its current school system and in identifying the most important areas for improvement.'
    ],
  )
];

const dummyData_services = [
  Services(
    id: 's1',
    title: 'Upscale Your Business',
    imageUrl: 'assets/images/services/service_upscale.jpg',
    bgimage: 'assets/images/services/illustration_upscale.jpg',
    details: [
      'An upscale business refers to a company that targets higher-end customers and offers products or services that are considered luxurious or exclusive. These businesses generally focus on providing a superior customer experience, premium quality products, and a prestigious brand image.'
    ],
    types: [
      'There are several types of upscaling strategies that we provide to enhance business upscale status:'
          '\n - Product Upscaling'
          '\n - Price Upscaling'
          '\n - Brand Upscaling'
          '\n - Customer Service Upscaling'
          '\n - Store/Location Upscaling'
    ],
  ),
  Services(
    id: 's2',
    title: 'Take Over Businesses',
    imageUrl: 'assets/images/services/service_takeover.jpg',
    bgimage: 'assets/images/services/illustration_take_over.jpg',
    details: [
      'Taking over a business refers to the acquisition or control of an existing company by another entity. It typically involves the transfer of ownership, management, assets, and liabilities from one company to another. '
    ],
    types: [
      'There are several types of takeovers that can occur in a business context:'
          '\n - Management Takeover'
          '\n - Friendly Takeover'
          '\n - Hostile Takeover'
          '\n - Asset Takeover'
          '\n - Reverse Takeover'
    ],
  ),
  Services(
    id: 's3',
    title: 'Increase Your Sales',
    imageUrl: 'assets/images/services/service_sales.jpg',
    bgimage: 'assets/images/services/illustration_sales.jpg',
    details: [
      'Increasing sales refers to the process of generating more revenue for a business by selling more of its products or services. This can be achieved through various strategies and techniques depending on the nature of the business and its target audience. '
    ],
    types: [
      'There are different types of increase sales strategies that we provide for businesses to adopt, including:'
          '\n - Marketing and advertising'
          '\n - Product diversification'
          '\n - Pricing strategies'
          '\n - Upselling and cross-selling'
          '\n - Improving sales processes'
          '\n - Online presence and e-commerce'
          '\n - Customer retention'
    ],
  ),
  Services(
    id: 's4',
    title: 'Make Franchise Model',
    imageUrl: 'assets/images/services/service_make_franchises.jpg',
    bgimage: 'assets/images/services/illustration_franchise.jpg',
    details: [
      'A franchise model is a type of business arrangement where the owner of an established brand  grants a license or permission to an individual or entity (the franchisee) to operate a business under their established brand name and business system. The franchisee pays an initial fee and ongoing royalties in return for the support, training, and use of the franchisor\'s brand and operating model.'
    ],
    types: [
      'We provide several types of franchise models:'
          '\n - Product Distribution'
          '\n - Business Format'
          '\n - Area Development'
          '\n - Master Franchise'
          '\n - Co-branding'
    ],
  ),
  Services(
    id: 's5',
    title: 'Improve Your Financial Decisions',
    imageUrl: 'assets/images/services/service_financial.jpg',
    bgimage: 'assets/images/services/illustration_financial.jpg',
    details: [
      'Improving financial decisions refers to the process of making better choices related to managing money, investments, and financial planning. It involves considering various factors such as risks, costs, benefits, and long-term goals to make informed decisions that lead to improved financial outcomes.'
    ],
    types: [
      'We provide different types of strategies to improve financial decisions:'
          '\n - Budgeting'
          '\n - Saving and Investing'
          '\n - Debt Management'
          '\n - Risk Management'
          '\n - Financial Education'
          '\n - Setting Financial Goals'
    ],
  ),
  Services(
    id: 's6',
    title: 'Marketing Strategies',
    imageUrl: 'assets/images/services/service_marketing.jpg',
    bgimage: 'assets/images/services/illustration_marketing.jpg',
    details: [
      'Marketing strategies refer to a set of activities and tactics that businesses employ to promote and sell their products or services to target customers. These strategies aim to maximize profit and gain a competitive advantage in the marketplace.'
    ],
    types: [
      'We provide various types of marketing strategies, including:'
          '\n - Target Marketing'
          '\n - Differentiation'
          '\n - Branding'
          '\n - Content Marketing'
          '\n - Social Media Marketing'
          '\n - Influencer Marketing'
    ],
  ),
  Services(
    id: 's7',
    title: 'Other Business Problem',
    imageUrl: 'assets/images/services/service_other.jpg',
    bgimage: 'assets/images/services/illustration_other.jpg',
    details: [
      'Other business problems can vary widely depending on the industry and company.'
    ],
    types: [
      'Some common types of business problems include:'
          '\n - Operational Challenges'
          '\n - Human Resources'
          '\n - Legal and Compliance'
          '\n - Customer Service'
          '\n - Competition'
          '\n - Strategic Decision Making'
          '\n\nIt is important for businesses to identify and address these problems promptly to ensure their long-term success and sustainability.'
    ],
  ),
];
const knowMoreData = [
  knowMore(
    id: 'k1',
    title: 'Upscale Your Business',
    details: [
      'A consultancy company can play a crucial role in upgrading a business by providing expert advice, analysis, and guidance in various areas. Here are some ways in which a consultancy company can help upgrade a business:'
    ],
    title1: 'Strategic Planning :',
    title1des: [
      'Consultants can assist in developing a clear and effective strategic plan for the business. They analyze market trends, competitor landscapes, and internal capabilities to identify growth opportunities and formulate a roadmap for success.'
    ],
    title2: 'Process Optimization :',
    title2des: [
      'Consultants can review existing business processes and identify areas of inefficiency. They propose improvements and help implement streamlined processes to enhance productivity and reduce operational costs.'
    ],
    title3: 'Market Research :',
    title3des: [
      'Conducting thorough market research is essential for any business looking to upgrade. Consultants can gather and analyze market data, customer feedback, and industry trends to help the business make informed decisions and stay ahead of the competition.'
    ],
    title4: 'Financial Management :',
    title4des: [
      'Consultants can assess the financial health of the business, identify areas of financial waste, and suggest ways to optimize budgeting and financial planning. This may include cost-cutting measures, investment strategies, and improving cash flow management.'
    ],
    title5: 'Technology Integration :',
    title5des: [
      'Upgrading technology can significantly boost a business\'s efficiency and competitiveness. Consultants can advise on the right technology solutions for the business, facilitate their integration, and train employees to use them effectively.'
    ],
    title6: 'Organizational Restructuring :',
    title6des: [
      'If a business is facing challenges with its organizational structure, consultants can recommend changes that align with the business\'s goals. This might involve creating new departments, defining roles and responsibilities, and implementing performance management systems.'
    ],
    title7: 'Marketing and Branding :',
    title7des: [
      'Consultants can help businesses develop effective marketing strategies to reach their target audience, improve brand visibility, and increase customer engagement. This could involve digital marketing, content creation, and social media strategies.'
    ],
    title8: 'Risk Management :',
    title8des: [
      'Assessing and mitigating risks is crucial for sustainable growth. Consultants can identify potential risks, such as regulatory compliance issues or supply chain vulnerabilities, and develop strategies to manage and minimize these risks.'
    ],
    title9: 'Training and Skill Development :',
    title9des: [
      'A consultancy company may provide training programs to enhance the skills and knowledge of employees. This investment in human capital can lead to improved performance and innovation within the organization.'
    ],
    title10: 'Expansion and Diversification :',
    title10des: [
      'Consultants can assist with business expansion plans, whether through entering new markets, launching new products or services, or exploring partnerships and acquisitions.'
    ],
    title11: 'Sustainability and Corporate Social Responsibility (CSR) :',
    title11des: [
      'As sustainability becomes increasingly important to consumers and stakeholders, consultants can help businesses integrate sustainable practices and CSR initiatives into their operations.'
    ],
  ),
  knowMore(
    id: 'k2',
    title: 'Take Over Businesses',
    details: [
      'When a business is considering a takeover or merger with another company, a consultancy company can play a pivotal role in facilitating the process and ensuring its success. Here\'s how they can help:'
    ],
    title1: 'Market Research and Due Diligence :',
    title1des: [
      'The consultancy company can conduct comprehensive market research and due diligence on the target company. This involves assessing its financial health, market position, potential risks, legal and regulatory compliance, and overall compatibility with the acquiring company\'s strategic goals.'
    ],
    title2: 'Valuation and Negotiation :',
    title2des: [
      'Consultants can assist in determining a fair and accurate valuation of the target company based on its assets, liabilities, market value, and potential synergies with the acquiring company. They can also negotiate the terms of the deal to ensure favorable conditions for their client.'
    ],
    title3: 'Legal and Regulatory Compliance :',
    title3des: [
      'Mergers and acquisitions often involve complex legal and regulatory processes. Consultants can work alongside legal experts to ensure that all necessary documents are in order, and the acquisition complies with relevant laws and regulations.'
    ],
    title4: 'Strategic Planning  : ',
    title4des: [
      'Consultancy firms assist businesses in developing a strategic roadmap for potential acquisitions. They analyze market trends, identify attractive target companies, and devise a plan to integrate them into the existing business model.'
    ],
    title5: 'Financial and Operational Analysis :',
    title5des: [
      'The consultancy company can analyze the financial and operational aspects of both companies to identify potential synergies and cost-saving opportunities post-acquisition. This analysis helps the acquiring company to maximize the benefits of the merger.'
    ],
    title6: 'Change Management and Communication :',
    title6des: [
      'Mergers and acquisitions can create uncertainty and resistance among employees and stakeholders. Consultants can develop effective change management strategies to address these concerns and ensure a smooth transition. They also assist in communication plans to keep all stakeholders informed throughout the process.'
    ],
    title7: 'Deal Structuring :',
    title7des: [
      'Consultancy firms provide expertise in negotiating acquisition deals. They assist in structuring the transaction, determining the payment terms, and resolving any legal or regulatory issues. Their expertise ensures that the acquiring business gets the best possible deal.'
    ],
    title8: 'Risk Assessment and Mitigation :',
    title8des: [
      'Consultants help identify potential risks associated with the acquisition and develop strategies to mitigate them. This might include financial risks, operational challenges, or any unexpected issues that could arise during the integration process.'
    ],
    title9: 'Post-Merger Evaluation :',
    title9des: [
      'After the acquisition, consultants can conduct post-merger evaluations to assess the success of the integration and identify any areas that need further attention or improvement.'
    ],
    title10: 'Integration Planning :',
    title10des: [
      'A smooth integration of the two companies is critical for the success of the takeover. Consultants help create a detailed integration plan that outlines how the two entities will come together, including combining operations, cultures, and systems.'
    ],
    title11: 'Cultural Alignment :',
    title11des: [
      'Different company cultures can be a significant challenge during a takeover. Consultants work with the leadership to identify and address cultural differences and ensure that the organizational cultures align for a successful integration.'
    ],
  ),
  knowMore(
    id: 'k3',
    title: 'Increase Your Sales',
    details: [
      'A consultancy company can provide valuable assistance to a business in increasing their sales by identifying areas of improvement, developing effective strategies, and implementing best practices. Here are some ways in which a consultancy company can help a business boost its sales:'
    ],
    title1: 'Sales Strategy Development :',
    title1des: [
      'Consultants can work with the business to develop a comprehensive sales strategy that aligns with the company\'s goals and target market. This strategy may include identifying target customer segments, determining pricing strategies, and setting sales targets.'
    ],
    title2: 'Market Research :',
    title2des: [
      'Conducting thorough market research helps identify customer needs, preferences, and pain points. Consultants can analyze market trends, competitor strategies, and customer feedback to provide insights that inform the business\'s sales approach.'
    ],
    title3: 'Sales Training and Coaching :',
    title3des: [
      'Providing sales training and coaching to the sales team is crucial for improving their skills and techniques. Consultants can design customized training programs to enhance sales representatives capabilities, such as prospecting, objection handling, and closing deals.'
    ],
    title4: 'Sales Process Optimization :',
    title4des: [
      'Reviewing and optimizing the sales process can lead to improved efficiency and higher conversion rates. Consultants can identify bottlenecks, streamline processes, and implement sales automation tools to facilitate the sales journey.'
    ],
    title5: 'Customer Relationship Management (CRM) Implementation :',
    title5des: [
      'A CRM system can help manage customer data, track leads, and streamline sales workflows. Consultants can assist in selecting the right CRM platform and ensuring its effective implementation within the organization.'
    ],
    title6: 'Sales and Marketing Alignment :',
    title6des: [
      'Collaborating closely between the sales and marketing departments is vital for success. Consultants can foster better alignment between the two teams, ensuring that marketing efforts generate high-quality leads that sales can convert.'
    ],
    title7: 'Sales Incentive Programs :',
    title7des: [
      'Consultants can advise on implementing effective sales incentive programs to motivate and reward the sales team for achieving targets and driving results.'
    ],
    title8: 'Customer Experience Enhancement :',
    title8des: [
      'Improving the customer experience can lead to higher customer retention and word-of-mouth referrals. Consultants can assess the current customer experience and recommend strategies to enhance it.'
    ],
    title9: 'Cross-Selling and Upselling Strategies :',
    title9des: [
      'Consultants can help businesses identify opportunities for cross-selling and upselling to existing customers, increasing the average transaction value and customer lifetime value.'
    ],
    title10: 'Sales Performance Analytics :',
    title10des: [
      'Implementing sales performance analytics allows businesses to track and measure key sales metrics. Consultants can help set up relevant KPIs and dashboards, enabling data-driven decision-making.'
    ],
    title11: 'International Sales Expansion :',
    title11des: [
      'For businesses looking to expand sales internationally, consultants can provide insights into new markets, cultural considerations, and export/import regulations.'
    ],
  ),
  knowMore(
    id: 'k4',
    title: 'Make Franchise Model',
    details: [
      'When a business decides to create a franchise model, a consultancy company can offer valuable guidance and support throughout the process. Developing a successful franchise system requires careful planning, legal compliance, and strategic decision-making. Here\'s how a consultancy company can help:'
    ],
    title1: 'Feasibility Study :',
    title1des: [
      'Consultants can conduct a feasibility study to determine if the business is suitable for franchising. They assess factors such as market demand, competition, scalability, and profitability to ensure that the franchise model is viable.'
    ],
    title2: 'Franchise Structure and Legal Compliance :',
    title2des: [
      'Setting up a franchise involves legal complexities. Consultants can work with legal experts to develop the franchise structure, create the Franchise Disclosure Document (FDD), and ensure compliance with relevant franchising laws and regulations.'
    ],
    title3: 'Operations Manual :',
    title3des: [
      'A comprehensive operations manual is essential for maintaining consistency across franchise locations. Consultants can help create a detailed manual that outlines all aspects of running the business, including standard operating procedures, quality control, and customer service guidelines.'
    ],
    title4: 'Franchisee Selection :',
    title4des: [
      'Consultants can assist in developing a franchisee selection process to identify qualified and motivated individuals who are a good fit for the franchise system.'
    ],
    title5: 'Training Programs :',
    title5des: [
      'Franchisees need proper training to run the business successfully. Consultants can design training programs that cover all aspects of the business, from operations to marketing and customer relations.'
    ],
    title6: 'Franchise Marketing Strategy :',
    title6des: [
      'Developing a marketing strategy to attract potential franchisees is crucial. Consultants can create marketing materials and campaigns that highlight the benefits of joining the franchise and target the right audience.'
    ],
    title7: 'Support System :  ',
    title7des: [
      'A strong support system is essential for franchisees to thrive. Consultants can help design ongoing support mechanisms such as regular communication, field visits, and continuous training.'
    ],
    title8: 'Financial Planning :',
    title8des: [
      'Consultants can assist in determining the initial franchise fee, ongoing royalties, and other financial aspects of the franchise model to ensure a sustainable and profitable relationship for both the franchisor and franchisees.'
    ],
    title9: 'Pilot Testing :',
    title9des: [
      'Before launching the franchise system on a large scale, consultants may recommend pilot testing in a few locations. This helps identify any operational or logistical challenges and allows for adjustments to be made before expanding further.'
    ],
    title10: 'Performance Measurement :',
    title10des: [
      'Setting up performance metrics and evaluation mechanisms is critical for monitoring the success of the franchise model. Consultants can establish key performance indicators (KPIs) and reporting systems to track franchisee performance and overall system health.'
    ],
    title11: 'International Franchising (if applicable) : ',
    title11des: [
      'If the business plans to expand internationally, consultants can guide them through the additional complexities involved in cross-border franchising, including cultural considerations and legal requirements.'
    ],
  ),
  knowMore(
    id: 'k5',
    title: 'Improve Your Financial Decisions',
    details: [
      'A consultancy company can help businesses increase their finance by providing expert advice and guidance in various financial aspects. Here are some ways in which a consultancy company can assist a business in improving its financial position:'
    ],
    title1: 'Financial Analysis :',
    title1des: [
      'Consultants can conduct a thorough financial analysis of the business to identify areas of strength and weakness. This analysis may include a review of financial statements, cash flow, profitability, and financial ratios.'
    ],
    title2: 'Cost Reduction Strategies :',
    title2des: [
      'Consultants can identify cost-saving opportunities within the business operations. They may recommend strategies to optimize expenses, renegotiate contracts, or improve efficiency to increase profitability.'
    ],
    title3: 'Revenue Enhancement :',
    title3des: [
      'Consultants can work with the business to explore new revenue streams and opportunities for growth. This might involve market expansion, product diversification, or exploring partnerships and collaborations.'
    ],
    title4: 'Financial Planning and Budgeting :',
    title4des: [
      'Developing a comprehensive financial plan and budget is essential for managing finances effectively. Consultants can help the business create realistic financial goals and develop a strategic budget to achieve them.'
    ],
    title5: 'Working Capital Management :',
    title5des: [
      'Effective management of working capital is crucial for maintaining liquidity and financial stability. Consultants can advise on optimizing inventory, accounts receivable, and accounts payable to improve cash flow.'
    ],
    title6: 'Capital Structure and Funding Options :',
    title6des: [
      'Consultants can assess the business\'s capital structure and recommend appropriate funding options, such as debt financing, equity financing, or venture capital, to support growth initiatives.'
    ],
    title7: 'Investment and Asset Management :',
    title7des: [
      'Consultants can offer guidance on investment decisions and asset allocation to maximize returns and minimize risks.'
    ],
    title8: 'Financial Risk Management :',
    title8des: [
      'Identifying and mitigating financial risks is vital for the long-term success of the business. Consultants can help implement risk management strategies to protect the business from potential financial setbacks.'
    ],
    title9: 'Financial Reporting and Compliance :',
    title9des: [
      'Consultants can assist in creating accurate and timely financial reports that comply with accounting standards and regulatory requirements.'
    ],
    title10: 'Mergers and Acquisitions (M&A) :',
    title10des: [
      'If the business is considering mergers or acquisitions, consultants can provide financial due diligence, valuation, and negotiation support.'
    ],
    title11: 'Tax Planning :',
    title11des: [
      'Consultants can help the business optimize its tax strategy, ensuring compliance with tax laws while minimizing tax liabilities.'
    ],
  ),
  knowMore(
    id: 'k6',
    title: 'Marketing Straregies',
    details: [
      'A consultancy company can play a significant role in helping businesses develop better marketing strategies by providing expertise, analysis, and insights. Here\'s how they can assist in improving marketing strategies:'
    ],
    title1: 'Market Research :',
    title1des: [
      'Consultants can conduct in-depth market research to identify target audiences, understand customer needs and preferences, and analyze the competitive landscape. This data-driven approach ensures that marketing strategies are well-informed and tailored to the right audience.'
    ],
    title2: 'Brand Positioning and Messaging :',
    title2des: [
      'Consultants can help businesses refine their brand positioning and messaging to create a strong and consistent brand identity. This involves defining the unique value proposition and crafting compelling messages that resonate with the target market.'
    ],
    title3: 'Digital Marketing Strategies :',
    title3des: [
      'The digital landscape is ever-changing, and consultants can assist businesses in navigating this space effectively. They can recommend appropriate digital marketing channels, such as social media, content marketing, SEO, and email marketing, to reach and engage the target audience.'
    ],
    title4: 'Offline Marketing Strategies :',
    title4des: [
      'Traditional marketing methods still have their place, and consultants can advise on integrating offline strategies like print advertising, direct mail, events, and public relations into the overall marketing mix.'
    ],
    title5: 'Content Strategy :',
    title5des: [
      'Content is a crucial part of modern marketing. Consultants can help businesses develop a content strategy that aligns with their brand, resonates with the audience, and supports their marketing objectives.'
    ],
    title6: 'Marketing Automation :',
    title6des: [
      'Consultants can recommend and implement marketing automation tools to streamline marketing processes, nurture leads, and improve overall efficiency.'
    ],
    title7: 'Measuring and Analyzing Performance :',
    title7des: [
      'Consultants can establish key performance indicators (KPIs) to measure the success of marketing campaigns. They analyze data and metrics to identify areas of improvement and optimize marketing efforts for better results.'
    ],
    title8: 'Segmentation and Personalization :',
    title8des: [
      'Consultants can guide businesses in segmenting their target audience and creating personalized marketing campaigns that cater to the specific needs and interests of different customer groups.'
    ],
    title9: 'Innovative Marketing Initiatives :',
    title9des: [
      'Consultants can bring fresh ideas and innovative approaches to marketing, helping businesses stand out from the competition and capture the attention of their audience.'
    ],
    title10: 'Social Media Strategies :',
    title10des: [
      'Social media is a powerful marketing tool, and consultants can help businesses develop effective social media strategies to build brand awareness, engage with customers, and drive conversions.'
    ],
    title11: 'Competitor Analysis :',
    title11des: [
      'Consultants can analyze competitors\' marketing strategies to identify areas of opportunity and differentiation for the business.'
    ],
  ),
  knowMore(
    id: 'k7',
    title: 'Other Business Problems',
    details: [
      'A consultancy company can be a valuable resource for businesses facing various challenges and problems. Here are some ways in which a consultancy company helps businesses address their issues:'
    ],
    title1: 'Expertise and Specialization :',
    title1des: [
      'Consultancy firms typically have experts with specialized knowledge and experience in different industries and domains. Businesses can tap into this expertise to gain insights into their specific problems and potential solutions.'
    ],
    title2: 'Objective Perspective :',
    title2des: [
      'As an external entity, a consultancy company can provide an unbiased and objective perspective on the business\'s challenges. This fresh viewpoint can lead to new insights and innovative solutions that might be overlooked internally.'
    ],
    title3: 'Problem Identification and Root Cause Analysis :',
    title3des: [
      'Consultants are skilled in analyzing complex business situations and identifying the root causes of problems. By pinpointing the underlying issues, businesses can focus on addressing the core challenges rather than treating symptoms.'
    ],
    title4: 'Customized Solutions :',
    title4des: [
      'Consultancy companies tailor their recommendations to each business\'s unique circumstances. They develop customized strategies and action plans to address the specific problems faced by the business.'
    ],
    title5: 'Strategic Planning and Decision-making :',
    title5des: [
      'Consultants can assist businesses in developing strategic plans and making informed decisions. This includes evaluating different options, conducting risk assessments, and considering long-term implications.'
    ],
    title6: 'Change Management :',
    title6des: [
      'When a business needs to undergo significant changes, consultants can guide them through the process. They help manage change, minimize resistance, and ensure a smooth transition.'
    ],
    title7: 'Implementation Support :',
    title7des: [
      'It\'s not enough to have a great strategy; successful implementation is essential. Consultancy companies can provide support throughout the implementation process, helping businesses execute plans effectively.'
    ],
    title8: 'Performance Improvement :',
    title8des: [
      'Consultants can help businesses identify opportunities for performance improvement and efficiency gains. They assist in setting performance metrics, tracking progress, and optimizing operations.'
    ],
    title9: 'Market Insights and Trends :',
    title9des: [
      'Consultancy firms stay updated with market trends, industry best practices, and emerging technologies. They can advise businesses on adapting to market changes and staying ahead of competitors.'
    ],
    title10: 'Training and Skill Development :',
    title10des: [
      'In some cases, the challenges a business faces may be due to a lack of specific skills or knowledge. Consultancy companies can offer training programs to develop the capabilities of the workforce.'
    ],
    title11: 'Crisis Management :',
    title11des: [
      'When businesses encounter unexpected crises, consultancy companies can offer crisis management services, helping organizations navigate difficult situations and make critical decisions.'
    ],
  ),
];

const assignprojectdetails = [
  AssignProjectDetails(
    id: 'a1',
    title: 'Adani Ltd',
    disc:
        'Adani want\'s to make a sales engagement platform that accelerates B2B sales pipeline through a multi-channel outreach capability to book more meetings and close more revenue.',
    task: ['adf', 'asdf', 'sadf'],
  ),
];
// const assignedprojects = [
//   AssignedProjects(
//       id: 's1',
//       title: 'Upscale Your Business',
//       country: 'india',
//       mobile: ' +91 9879382701',
//       email: 'palgabani03@gmail.com'),
//   AssignedProjects(
//       id: 's2',
//       title: 'Take Over Businesses',
//       country: 'india',
//       mobile: ' +91 9879382701',
//       email: 'smitkachdiya@gmail.com'),
//   AssignedProjects(
//       id: 's3',
//       title: 'Increase Your Sales',
//       country: 'india',
//       mobile: ' +91 9879382701',
//       email: 'jaygoyani@gmail.com'),
//
// ];
List<AssignedProject> assignedProjects = [
  AssignedProject(
    id: 's1',
    title: 'Upscale Your Business',
    country: 'india',
    mobile: '+91 9879382701',
    email: 'palgabani03@gmail.com',
    current_index: 0,
    maindetails: MainDetails(
      companyname: 'Adani Ltd.........',
      description: 'Main Description 1',
      duedate: '2023-09-01',
    ),
    details:
      ProjectDetail( task1: 'Task 1 for Project 1',
        task1detail: 'Task 1 detail for Project 1',
        task2: 'Task 2 for Project 1',
        task2detail: 'Task 2 detail for Project 1',
        task3: 'Task 3 for Project 1',
        task3detail: 'Task 3 detail for Project 1',),



  ),
  // You can add more entries here with similar structure
];
