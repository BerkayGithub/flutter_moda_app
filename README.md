# flutter_moda_app

A new Flutter project. It is a non-functional fashion app design.

<img width="1080" height="2424" alt="Screenshot_20251127_135706" src="https://github.com/user-attachments/assets/707c266f-c4cd-40e8-bc3e-b12bf22e4844" />

## DecorationImage

A BoxDecoration parameter for displaying images. You can receive your image from the assets folder or from network.

pubspec.yaml

    flutter:

      assets:
        - assets/

      fonts:
        - family: Montserrat
          fonts:
            - asset: assets/fonts/Montserrat-Regular.ttf

main.dart

    @override
    Widget build(BuildContext context) {
      //Other widgets
      listeElemani('assets/model1.jpeg', "assets/chanellogo.jpg")
      //Other Widgets
    }

    Widget listeElemani(String imagePath, String logoPath) {
        //Other Widgets
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
          ),
        )
        //Other Widgets
    }

## Positioned

A widget that controls where a child of a Stack is positioned.

If a widget is wrapped in a Positioned, then it is a positioned widget in its Stack. If the top property is non-null, the top edge of this child will be positioned top layout units from the top of the stack widget. The right, bottom, and left properties work analogously.

main.dart

    Positioned(
      top: 50,
      left: 50,
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(image: AssetImage(logoPath), fit: BoxFit.cover)
        ),
      ),
    )

## Font Family

pubspec.yaml

    flutter:

      fonts:
        - family: Montserrat
          fonts:
            - asset: assets/fonts/Montserrat-Regular.ttf


main.dart

    child: Text("Follow", style: TextStyle(fontFamily: 'Montserrat', color: Colors.white)),

## Bottom Navigation with TabBar

A Material Design primary tab bar.

Primary tabs are usually placed at the top of the content pane under a top app bar but they can be placed at the bottom using bottomNavigationBar attribute in Scaffold. They display the main content destinations.

main.dart

    @override
      Widget build(BuildContext context) {
        return Scaffold(
          bottomNavigationBar: Material(
            color: Colors.white,
            child: TabBar(
              controller: tabController,
              tabs: [
                Tab(icon: Icon(Icons.more, color: Colors.grey, size: 16)),
                Tab(icon: Icon(Icons.play_arrow, color: Colors.grey, size: 16)),
                Tab(icon: Icon(Icons.navigation, color: Colors.grey, size: 16)),
                Tab(
                  icon: Icon(
                    Icons.supervised_user_circle,
                    color: Colors.grey,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),

  If a TabController is not provided, then a DefaultTabController ancestor must be provided instead. The tab controller's TabController.length must equal the length of the tabs list and the length of the TabBarView.children list.

  main.dart

      class _AnaSayfaState extends State<AnaSayfa> with SingleTickerProviderStateMixin {
        late TabController tabController;
      
        @override
        void initState() {
          // TODO: implement initState
          super.initState();
          tabController = TabController(length: 4, vsync: this);
        }
      
        @override
        void dispose() {
          tabController.dispose();
          super.dispose();
        }

## Inkwell

By wrapping a widget that supports onTouch / onTap functions, you can give it a splash effect.

main.dart

    InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Detay(
              imgPath: 'assets/modelgrid1.jpeg',
            ),
          ),
        );
      },
      child: Hero(
        tag: 'assets/modelgrid1.jpeg',
        child: Container(
          height: 200,
          width: (MediaQuery.of(context).size.width - 50) / 2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/modelgrid1.jpeg"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    ),

## Hero

A widget that marks its child as being a candidate for hero animations.

When a PageRoute is pushed or popped with the Navigator, the entire screen's content is replaced. An old route disappears and a new route appears. If there's a common visual feature on both routes then it can be helpful for orienting the user for the feature to physically move from one page to the other during the routes' transition. Such an animation is called a hero animation. The hero widgets "fly" in the Navigator's overlay during the transition and while they're in-flight they're, by default, not shown in their original locations in the old and new routes.

To label a widget as such a feature, wrap it in a Hero widget. When navigation happens, the Hero widgets on each route are identified by the HeroController. For each pair of Hero widgets that have the same tag, a hero animation is triggered.

If a Hero is already in flight when navigation occurs, its flight animation will be redirected to its new destination. The widget shown in-flight during the transition is, by default, the destination route's Hero's child.

For a Hero animation to trigger, the Hero has to exist on the very first frame of the new page's animation.

Routes must not contain more than one Hero for each tag.

main.dart

    InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Detay(
              imgPath: 'assets/modelgrid1.jpeg',
            ),
          ),
        );
      },
      child: Hero(
        tag: 'assets/modelgrid1.jpeg',
        child: Container(
          height: 200,
          width: (MediaQuery.of(context).size.width - 50) / 2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/modelgrid1.jpeg"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        borderRadius: BorderRadius.circular(5),
      ),  

detay.dart

    class _DetayState extends State<Detay> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              Hero(
                tag: widget.imgPath,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.imgPath), fit: BoxFit.cover)),
                ),
              ),
              // Other Widgets
